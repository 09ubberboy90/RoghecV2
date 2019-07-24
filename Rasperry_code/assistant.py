# Copyright (C) 2017 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Sample that implements gRPC client for Google Assistant API."""
from gtts import gTTS
import struct
import subprocess
import json
import logging
import os.path
import device_helpers
import browser_helpers
import click
import grpc
import google.auth.transport.grpc
import google.auth.transport.requests
import google.oauth2.credentials
import google_control
from lxml import html
from google.assistant.embedded.v1alpha1 import embedded_assistant_pb2,embedded_assistant_pb2_grpc
from google.assistant.embedded.v1alpha2 import (
    embedded_assistant_pb2,
    embedded_assistant_pb2_grpc
)

from google.rpc import code_pb2
from tenacity import retry, stop_after_attempt, retry_if_exception

try:
    from googlesamples.assistant.grpc import (
        assistant_helpers,
        audio_helpers
    )
except SystemError:
    import assistant_helpers
    import audio_helpers


ASSISTANT_API_ENDPOINT = 'embeddedassistant.googleapis.com'
END_OF_UTTERANCE = embedded_assistant_pb2.AssistResponse.END_OF_UTTERANCE
DIALOG_FOLLOW_ON = embedded_assistant_pb2.DialogStateOut.DIALOG_FOLLOW_ON
CLOSE_MICROPHONE = embedded_assistant_pb2.DialogStateOut.CLOSE_MICROPHONE
PLAYING = embedded_assistant_pb2.ScreenOutConfig.PLAYING
DEFAULT_GRPC_DEADLINE = 60 * 3 + 5


class Assistant():

    def __init__(self):
        self.api_endpoint = ASSISTANT_API_ENDPOINT
        self.credentials = os.path.join(click.get_app_dir('google-oauthlib-tool'),
                                   'credentials.json')
        # Setup logging.
        logging.basicConfig() # filename='assistant.log', level=logging.DEBUG if self.verbose else logging.INFO)
        self.logger = logging.getLogger("assistant")
        self.logger.setLevel(logging.DEBUG)
        self.custom_command = False
        self.once = True
        # Load OAuth 2.0 credentials.
        try:
            with open(self.credentials, 'r') as f:
                self.credentials = google.oauth2.credentials.Credentials(token=None,
                                                                    **json.load(f))
                self.http_request = google.auth.transport.requests.Request()
                self.credentials.refresh(self.http_request)
        except Exception as e:
            logging.error('Error loading credentials: %s', e)
            logging.error('Run google-oauthlib-tool to initialize '
                          'new OAuth 2.0 credentials.')
            return

        # Create an authorized gRPC channel.
        self.grpc_channel = google.auth.transport.grpc.secure_authorized_channel(
            self.credentials, self.http_request, self.api_endpoint)
        logging.info('Connecting to %s', self.api_endpoint)
        self.audio_sample_rate = audio_helpers.DEFAULT_AUDIO_SAMPLE_RATE
        self.audio_sample_width = audio_helpers.DEFAULT_AUDIO_SAMPLE_WIDTH
        self.audio_iter_size = audio_helpers.DEFAULT_AUDIO_ITER_SIZE
        self.audio_block_size = audio_helpers.DEFAULT_AUDIO_DEVICE_BLOCK_SIZE
        self.audio_flush_size = audio_helpers.DEFAULT_AUDIO_DEVICE_FLUSH_SIZE
        self.grpc_deadline = DEFAULT_GRPC_DEADLINE
        self.device_id = "roghecv2assistant-roghecv2-59lv9s"
        # Create Google Assistant API gRPC client.
        self.assistant = embedded_assistant_pb2_grpc.EmbeddedAssistantStub(self.grpc_channel)

        # Opaque blob provided in AssistResponse that,
        # when provided in a follow-up AssistRequest,
        # gives the Assistant a context marker within the current state
        # of the multi-Assist()-RPC "conversation".
        # This value, along with MicrophoneMode, supports a more natural
        # "conversation" with the Assistant.
        self.conversation_state = None
        # Force reset of first conversation.
        self.is_new_conversation = True

        self.device_handler = device_helpers.DeviceRequestHandler("roghecv2assistant-roghecv2-59lv9s")

        # Stores the current volument percentage.
        # Note: No volume change is currently implemented in this sample
        self.volume_percentage = 50
        self.display = True
    
    def assist(self,canvas):
        device_actions_futures = []

        # Configure audio source and sink.
        self.audio_device = None
        self.audio_source = self.audio_device = (
            self.audio_device or audio_helpers.SoundDeviceStream(
                sample_rate=self.audio_sample_rate,
                sample_width=self.audio_sample_width,
                block_size=self.audio_block_size,
                flush_size=self.audio_flush_size
            )
        )

        self.audio_sink = self.audio_device = (
            self.audio_device or audio_helpers.SoundDeviceStream(
                sample_rate=self.audio_sample_rate,
                sample_width=self.audio_sample_width,
                block_size=self.audio_block_size,
                flush_size=self.audio_flush_size
            )
        )

        # Create conversation stream with the given audio source and sink.
        self.conversation_stream = audio_helpers.ConversationStream(
            source=self.audio_source,
            sink=self.audio_sink,
            iter_size=self.audio_iter_size,
            sample_width=self.audio_sample_width
        )
        restart = False
        continue_dialog = True
        try:
            while continue_dialog:
                continue_dialog = False
                self.conversation_stream.start_recording()
                self.logger.info('Recording audio request.')

                def iter_log_assist_requests():
                    for c in self.gen_assist_requests():
                        assistant_helpers.log_assist_request_without_audio(c)
                        yield c
                    logging.debug('Reached end of AssistRequest iteration.')

                # This generator yields AssistResponse proto messages
                # received from the gRPC Google Assistant API.
                for resp in self.assistant.Assist(iter_log_assist_requests(),
                                                self.grpc_deadline):
                    assistant_helpers.log_assist_response_without_audio(resp)
                    if resp.event_type == END_OF_UTTERANCE:
                        logging.info('End of audio request detected.')
                        logging.info('Stopping recording.')
                        self.conversation_stream.stop_recording()
                    if resp.speech_results:
                        mess = ' '.join(r.transcript for r in resp.speech_results)
                        logging.info('Transcript of user request: "%s".',mess)
                        canvas[1]['text'] = mess
                        if self.once :
                            self.custom_command = google_control.custom_command_handler(mess,canvas)
                    if len(resp.audio_out.audio_data) > 0 and not self.custom_command:
                        if not self.conversation_stream.playing:
                            self.conversation_stream.stop_recording()
                            self.conversation_stream.start_playback()
                            logging.info('Playing assistant response.')
                        self.conversation_stream.write(resp.audio_out.audio_data)
                    if resp.dialog_state_out.conversation_state:
                        conversation_state = resp.dialog_state_out.conversation_state
                        logging.debug('Updating conversation state.')
                        self.conversation_state = conversation_state
                    if resp.dialog_state_out.volume_percentage != 0:
                        volume_percentage = resp.dialog_state_out.volume_percentage
                        logging.info('Setting volume to %s%%', volume_percentage)
                        self.conversation_stream.volume_percentage = volume_percentage
                    if resp.dialog_state_out.microphone_mode == DIALOG_FOLLOW_ON:
                        continue_conversation = True
                        logging.info('Expecting follow-on query from user.')
                    elif resp.dialog_state_out.microphone_mode == CLOSE_MICROPHONE:
                        continue_conversation = False
                    if resp.device_action.device_request_json:
                        device_request = json.loads(
                            resp.device_action.device_request_json
                        )
                        fs = self.device_handler(device_request)
                        if fs:
                            device_actions_futures.extend(fs)
                    if self.display and resp.screen_out.data and not self.custom_command:
                        system_browser = browser_helpers.system_browser
                        system_browser.display(resp.screen_out.data)
                        self.scrapper(canvas)

                self.logger.info('Finished playing assistant response.')
                self.conversation_stream.stop_playback()
        except Exception as e:
            self._create_assistant()
            self.logger.exception('Skipping because of connection reset')
            restart = True
        try:
            self.conversation_stream.close()
            if restart:
                self.assist()
        except Exception:
            self.logger.error('Failed to close conversation_stream.')
        self.once = True

    device_handler = device_helpers.DeviceRequestHandler("roghecv2assistant-roghecv2-59lv9s")

    def scrapper(self,canvas):
        tree = html.parse("/home/ubberboy/Documents/RoghecV2/snowboy/google-assistant-sdk-screen-out.html")
        result = tree.xpath('/html/body/div/div[2]/div[3]/div[2]/div/div/text()')
        final_text = '\n'.join(result)
        print(final_text)
        canvas[3]["text"] = ''.join(c if c <= '\uffff' else ''.join(chr(x) for x in struct.unpack('>2H', c.encode('utf-16be'))) for c in final_text)
    def _create_assistant(self):
        # Create gRPC channel
        grpc_channel = google.auth.transport.grpc.secure_authorized_channel(
            self.credentials, self.http_request, self.api_endpoint)

        self.logger.info('Connecting to %s', self.api_endpoint)
        # Create Google Assistant API gRPC client.
        self.assistant = embedded_assistant_pb2_grpc.EmbeddedAssistantStub(grpc_channel)

    def is_grpc_error_unavailable(e):
        is_grpc_error = isinstance(e, grpc.RpcError)
        if is_grpc_error and (e.code() == grpc.StatusCode.UNAVAILABLE):
            logging.error('grpc unavailable error: %s', e)
            return True
        return False

    @retry(reraise=True, stop=stop_after_attempt(3),
           retry=retry_if_exception(is_grpc_error_unavailable))

    @device_handler.command('action.devices.commands.OnOff')
    def onoff(on):
        if on:
            logging.info('Turning device on')
        else:
            logging.info('Turning device off')

    # This generator yields ConverseRequest to send to the gRPC
    # Google Assistant API.
    def gen_assist_requests(self):
        """Yields: AssistRequest messages to send to the API."""

        config = embedded_assistant_pb2.AssistConfig(
            audio_in_config=embedded_assistant_pb2.AudioInConfig(
                encoding='LINEAR16',
                sample_rate_hertz=self.conversation_stream.sample_rate,
            ),
            audio_out_config=embedded_assistant_pb2.AudioOutConfig(
                encoding='LINEAR16',
                sample_rate_hertz=self.conversation_stream.sample_rate,
                volume_percentage=self.conversation_stream.volume_percentage,
            ),
            dialog_state_in=embedded_assistant_pb2.DialogStateIn(
                conversation_state=self.conversation_state,
                is_new_conversation=self.is_new_conversation,
            ),            
            device_config=embedded_assistant_pb2.DeviceConfig(
                device_id=self.device_id,
                device_model_id=self.device_id,
            )

        )
        if self.display:
            config.screen_out_config.screen_mode = PLAYING
        # Continue current conversation with later requests.
        self.is_new_conversation = False
        # The first AssistRequest must contain the AssistConfig
        # and no audio data.
        yield embedded_assistant_pb2.AssistRequest(config=config)
        for data in self.conversation_stream:
            # Subsequent requests need audio data, but not config.
            yield embedded_assistant_pb2.AssistRequest(audio_in=data)

