import snowboydecoder
import sys
import signal
from assistant import Assistant

# Demo code for listening two hotwords at the same time

interrupted = False

#signal.signal(signal.SIGINT, signal_handler)

def signal_handler(signal, frame):
    global interrupted
    interrupted = True

def interrupt_callback():
    global interrupted
    return interrupted
stop_id = None
models = ["./RogHecVF.pmdl","./Roghec.pmdl"]
gen_canvas = None
sensitivity = [0.5]*len(models)

detector = None
assist = None
def detect_callback():
    detector.terminate()
    snowboydecoder.play_audio_file(snowboydecoder.DETECT_DING)
    assist.assist(gen_canvas)
    snowboydecoder.play_audio_file(snowboydecoder.DETECT_DONG)
    print(stop_id())
    if not stop_id():
        detector.start(detected_callback=detect_callback, interrupt_check=interrupt_callback, sleep_time=0.03)
# main loop
# make sure you have the same numbers of callbacks and models

def init(canvas,stop):
    print('Listening... Press Ctrl+C to exit')

    global stop_id
    global gen_canvas
    global detector
    global assist
    detector = snowboydecoder.HotwordDetector(models, sensitivity=sensitivity)

    # capture SIGINT signal, e.g., Ctrl+C
    assist = Assistant()

    stop_id = stop
    gen_canvas = canvas
    detector.start(detected_callback=detect_callback,
               interrupt_check=interrupt_callback,
               sleep_time=0.03)
