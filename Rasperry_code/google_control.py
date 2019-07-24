import time
import serial
import Pid_Controller
import pyttsx3
import custom_threads

ser = serial.Serial('/dev/ttyACM0', 9600, timeout=1)
thread = custom_threads.thread_with_trace(target=Pid_Controller.control, daemon = True)
def speak(audioString):
    print(audioString)    
    engine = pyttsx3.init()
    rate = engine.getProperty('rate')
    engine.setProperty('rate', rate-60)

    engine.say(audioString)
    engine.runAndWait()

def hello():
    # TODO : Implement control with the servos on the arms and head
    print("DONE")


def forward():
    send("DF99")

def backward():
    send("DB99")


def auto():
    send("A")
    thread.start()

def manual():
    send("M")
    if thread.is_alive():
        thread.kill()
        thread.join()

def init():
    ser.write(b's')
    ser.write(b'e')
    print(ser.readline().decode())

    ser.write(b's')
    ser.write(b's')
    print(ser.readline().decode())


def send(mess):
    for i in mess:
        ser.write(i.encode())
    print(mess)

def custom_command_handler(self, mess, canvas):
    """
    Function for the vocal control
    """
    print("The message was : " + mess)
    hello_bool = False
    mess = mess.lower()
    command_hello = [["hello", "hey"], ["salut", "bonjour"]]
    command_forward = ["avance", "avant", "forward"]
    command_backward = ["recule", "arrière", "backward"]
    command_auto = ["auto", "automatic", "automatique"]
    command_manual = ["manual", "manuel"]
    if any(mess in s for s in command_hello):
        if mess in command_hello[0]:
            canvas[3]["text"] = "the Arm said hello back"
            self.speak("Hello to you too")
            google_control.hello()

        if mess in command_hello[1]:
            canvas[3]["text"] = "Le bras dit Bonjour"
            self.speak("Bonjour a vous aussi")
            google_control.hello()
        self.once = False
        return True
    else if mess in command_forward:
        if mess in command_forward[0] or mess in command_forward[1]:
            self.speal("je vais en avant")
            canvas[3]["text"] = "Direction vers l'avant"
        else:
            self.speak("I'm going forward")
            canvas[3]["text"] = "Going Forward"
        google_control.forward()
        return True
    else if mess in command_backward:
        if mess in command_backward[0] or mess in command_backward[1]:
            self.speal("je vais en arrière")
            canvas[3]["text"] = "Direction vers l'arrière"
        else:
            self.speak("I'm going backward")
            canvas[3]["text"] = "Going backward"
        google_control.backward()
        return True
    else if mess in command_auto:
        if mess in command_auto[0] or mess in command_auto[1]:
            self.speal("Je me stabilise")
            canvas[3]["text"] = "Stabilisation"
        else:
            self.speak("I'm stabilising myself")
            canvas[3]["text"] = "Stabilising"
        google_control.auto()
        return True
    else if mess in command_manual:
        if mess in command_manual[0]:
            self.speal("J'arrète de me stabiliser")
            canvas[3]["text"] = "Arret de la stabilisation"
        else:
            self.speak("I'm stopping my stabilization")
            canvas[3]["text"] = "Stopped stabilising"
        google_control.manual()
        return True

    else:
        return False


def act(data):
    """
    Function for the control of the webcam
    """
    print(data)
    # TODO : Implement code for arm and head control and other control as needed
    if data == "Forward":
        google_control.forward()

    if data == "Backward":
        google_control.backward()

    if data == "Auto":
        google_control.auto()

    if data == "Manual":
        google_control.manual()

    if data == "Hello":
        google_control.hello()