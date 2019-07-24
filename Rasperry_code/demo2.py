import snowboydecoder
import sys
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
models = ["/home/ubberboy/Documents/RoghecV2/snowboy/RogHecVF.pmdl","/home/ubberboy/Documents/RoghecV2/snowboy/Roghec.pmdl"]
gen_canvas = None
sensitivity = [0.49]*len(models)

detector = None
assist = None
def detect_callback():
    detector.terminate()
    snowboydecoder.play_audio_file(snowboydecoder.DETECT_DING)
    gen_canvas[4]["text"] = "LISTENING ...."
    assist.assist(gen_canvas)
    gen_canvas[4]["text"] = "SAY ROGHEC"
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
