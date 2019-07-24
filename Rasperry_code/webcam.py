import pyzbar.pyzbar as pyzbar
import numpy as np
from PIL import Image
from PIL import ImageTk
import PIL
import cv2
import time
import google_control
import tkinter

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
        google_control.act(obj.data.decode())


    
font = cv2.FONT_HERSHEY_SIMPLEX
webcam_image = None


def init(widget,stop):
    google_control.init()
    while(cap.isOpened() and not stop()):
        # Capture frame-by-frame
        ret, webcam_image = cap.read()
        photo = cv2.cvtColor(webcam_image, cv2.COLOR_BGR2RGB)

        photo = Image.fromarray(photo) 
        photo = photo.resize((500,350),Image.ANTIALIAS)
        photo = ImageTk.PhotoImage(photo)
        widget.config(image = photo)
        widget.image = photo
        # Our operations on the frame come here
        im = cv2.cvtColor(webcam_image, cv2.COLOR_BGR2GRAY)

        decodedObjects = decode(im)
    # When everything done, release the capture
    cap.release()
    cv2.destroyAllWindows()
