import pyzbar.pyzbar as pyzbar
import numpy as np
from PIL import Image
from PIL import ImageTk
import PIL
import cv2
import time
import serial
import threading

import tkinter
ser = serial.Serial('COM16', 9600, timeout=1)

# get the webcam:
cap = cv2.VideoCapture(0)

cap.set(3, 640)
cap.set(4, 480)
# 160.0 x 120.0
# 176.0 x 144.0
# 320.0 x 240.0
# 352.0 x 288.0
# 640.0 x 480.0
# 1024.0 x 768.0
# 1280.0 x 1024.0
time.sleep(2)
once = 0


def decode(im):
    # Find barcodes and QR codes
    decodedObjects = pyzbar.decode(im)
    # Print results
    if len(decodedObjects)!=0:
        obj = decodedObjects[0]
        print('Type : ', obj.type)
        print('Data : ', obj.data, '\n')
        act(obj.data.decode())


def act(data):
    global once
    print(data)
    if data == "Bonjour" and once == 0:
        #cap.release()
        hello()

def hello():
    global once
    #for pos0 in range(0, 90, 5):
    #send(f'R0{90-pos0:03d}')
    for pos5 in range(45, 120,4):
        send(f'R5{pos5:03d}')
        time.sleep(0.05)
    for i in range(45):
        send(f'R2{90+i:03d}')
        send(f'R3{90-i:03d}')
        time.sleep(0.05)
    for i in range(45):
        send(f'R2{135-i:03d}')
        send(f'R3{45+i:03d}')
        time.sleep(0.05)
    time.sleep(0.05)
    print("DONE")
    #cap = cv2.VideoCapture(0)


def send(mess):
    for i in mess:
        ser.write(i.encode())

font = cv2.FONT_HERSHEY_SIMPLEX
webcam_image = None


def init(widget,stop):
    print("Camera Initialized")
    ser.write(b's')
    ser.write(b'e')
    print(ser.readline().decode())

    ser.write(b's')
    ser.write(b's')
    print(ser.readline().decode())
    while(cap.isOpened() and not stop()):
        # Capture frame-by-frame
        ret, webcam_image = cap.read()
        photo = cv2.cvtColor(webcam_image, cv2.COLOR_BGR2RGB)

        photo = Image.fromarray(photo) 
        photo = ImageTk.PhotoImage(photo)
        widget.config(image = photo)
        widget.image = photo
        # Our operations on the frame come here
        im = cv2.cvtColor(webcam_image, cv2.COLOR_BGR2GRAY)

        decodedObjects = decode(im)
    # When everything done, release the capture
    cap.release()
    cv2.destroyAllWindows()
