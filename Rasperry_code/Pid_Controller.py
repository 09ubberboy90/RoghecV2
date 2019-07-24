import serial
import threading
import time
ser = serial.Serial('COM15',9600,timeout = 1)
arr = {}
numerateur = [0]*3
denominateur = [0]*3
mem_output = [0]*3
mem_input = [0]*3
pitch_list = [0]*10
index = 0

def get_pitch():
    out= 0
    actual_sum = 0
    for el in pitch_list:
        if el != 0:
            out+= el
            actual_sum+=1
    return out/actual_sum

def send_val(val):
    for el in val:
        ser.write(el.encode())

def read_val():
    ser.write("g".encode())
    rec = []
    for el in range(2):
        rec.append(ser.readline().decode())
    for el2 in rec[1].split(","):
        tmp = el2.split(": ")
        if not '\r\n' in tmp:
            arr[tmp[0]] = int(tmp[1])
    return arr

def printer():
    tmp_str = ""

    tmp_str += "\nTime : "
    tmp_str += str(time.time())
    tmp_str += "\n"

    tmp_str += "Numerateur : "
    tmp_str += ','.join(str(e) for e in numerateur)
    tmp_str += "\n"

    tmp_str += "Denominateur : "
    tmp_str += ','.join(str(e) for e in denominateur)
    tmp_str += "\n"

    tmp_str += "mem_input : "
    tmp_str += ','.join(str(e) for e in mem_input)
    tmp_str += "\n"

    tmp_str += "mem_output : "
    tmp_str += ','.join(str(e) for e in mem_output)
    tmp_str += "\n"
    
    tmp_str += "In : "
    tmp_str += str(get_pitch())
    tmp_str += "\n"
    
    tmp_str += "Out : "
    tmp_str += str(arr["Out"])
    tmp_str += "\n"

    tmp_str += "Motor : "
    tmp_str += str(arr["motor"])
    tmp_str += "\n"

    # print(denominateur)
    # print(mem_input)
    # print(mem_output)
    # print(arr["Out"])
    # print(arr["motor"])
    print(tmp_str)
    writer(tmp_str,"data.txt")
    writer(str(get_pitch())+",", "in.txt")


def writer(out_str,name):
    with open(name,"a+") as f:
        f.write(out_str)
    
def CorrecteurPID( te,P,taui,taud,Nd):
                   
    alpha = taud / (1 + taud + Nd * te)
    print("te = ",te)
    print("P = ",P)
    print("taui = ",taui)
    print("taud = ",taud)
    print("Nd = ",Nd)
    numerateur[0] = P * (1.0 + taud / (Nd * te) + te /
                         taui + taud / (Nd * taui) + taud / te)
    numerateur[1] = P * (-1 - 2 * taud / (Nd * te) -
                         taud / (Nd * taui) - 2 * taud / te)
    numerateur[2] = P * (taud / (Nd * te) + taud / te)

    denominateur[0] = 1.0 + taud / (Nd * te)
    denominateur[1] = -1.0 - 2 * taud / (Nd * te)
    denominateur[2] = taud / (Nd * te)


def compute(input_1):
    for i in range(2):
        mem_input[2-i] = mem_input[(2-i) - 1]
    mem_input[0] = input_1
    for i in range(2):
        mem_output[2-i] = mem_output[(2-i) - 1]
    out = 0
    for i in range(3):
        out += numerateur[i] * mem_input[i]
    for i in range(1, 3):
        out -= denominateur[i] * mem_output[i]

    out /= denominateur[0]
    mem_output[0] = out
    
    return out, motor(out)

def motor(val):
    pwm = 0
    if -12.0 <= val <= 12.0:
        send_val("DF00")
    else :
        pwm = int(min(abs(val/2+50), 99))
        if val > 0:
            send_val("DB{:2d}".format(pwm))
        else:
            send_val("DF{:2d}".format(pwm))
            pwm = -pwm
    return pwm


def control():
    read_val()
    CorrecteurPID(0.01, 40, 10e30, 0.1, 100)
    while True:
        try:
            tmp = read_val()
            pitch_list[index % 10] = tmp['Pitch']-2
            index += 1
            arr["Out"], arr["motor"] = compute(get_pitch())
            printer()
        except KeyboardInterrupt:
            time.sleep(1)
            send_val("RF00")
