import time
import serial
ser = serial.Serial('/dev/ttyACM0', 9600, timeout=1)

def hello():
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

