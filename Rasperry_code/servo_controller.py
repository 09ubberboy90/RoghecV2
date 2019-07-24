# -*- coding: utf-8 -*-
"""
Copyright(c) 2019 Florent Audonnet: audoflo63@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files(the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

"""

import sys
import time
import threading
import serial

class ServoController(object):
    """
    Create a controller for the robot arm through serial.


    Args:

        port (str): Name of the serial port to which the arm is connected to or name of the arm.

        nb_servo (int): Number of servo connected to the PIC

        baudrate (int, optional): Speed of communication. Defaults to 9600.
    """

    def __init__(self, port: str, nb_servo: int, baudrate: int = 9600):
        self.port = port
        self.nb_servo = nb_servo
        self.pin = {}
        # default value of init for the servo in the PIC 
        # * 12 since there is 12 available servo
        self.angle = [90]*12       
        self.messages = ""
        self.previous_mess = ""
        self.thread = threading.Thread(target=self.send_thread, daemon=True)
        self.thread.start()
        try:
            self.ser = serial.Serial(self.port, baudrate, timeout=1)
        except serial.SerialException:
            print("SerialException : Invalid Serial name. Please input a valid name")
            sys.exit()

        for i in range(self.nb_servo+1):
            self.pin[i] = i

        self.send("H")
        print(self.ser.readline()) # Acknowledge of the pic name
        self.send("SS") #Disable message from the PIC since it can cause error
    def send(self, mess):
        """
        Set the message to be sent in another thread

        Args:

            mess (string): the message you want to send
        """
        self.messages = mess


    def rename_pin(self, old_pin: int, new_pin: int):
        """
        Change the pin id to which the program is going to send the command
        Example : pin 3 is broken then reassign pin 3 to pin 12. but still refer to it as pin 12
        
        Args:
            
            old_pin (int): actual number the pin refers to


            new_pin (int): new number the pin refers to
        """

        self.pin[old_pin] = new_pin

    def send_thread(self):
        """
        send a message to the PIC one letter at a time in a non-blocking manner
        """
        while True:
            if self.messages == self.previous_mess:
                continue
            for i in self.messages:
                self.ser.write(i.encode())
            self.previous_mess = self.messages

    def enable_servo(self):
        """
        Enable the servos
        """
        self.send("SS")
        self.send("SE")


    def disable_servo(self):
        """
        Disable the servos
        """
        self.send("SD")
        self.send("SV")


    def set_angle(self, servo_id: int, angle: int, step: int, wait_time: int = 0.1):
        """
        Set the angle smoothly from the actual angle to a new one
        based on the step and the timeout in between

        Args:

            servo_id (int): ID of the servo needed to change angle. From 1 to nb_servo.

            angle (int): New angle the servo should be in.

            step (int): How much should the angle increase each loop. Must be smaller than.

            wait_time (int): How much time to wait in between command sending
        """
        actual_angle = self.angle[self.pin[servo_id]]
        interval = abs(actual_angle-angle)
        if actual_angle > angle:
            sign = -1
        else:
            sign = 1

        for new_angle in range(step, interval+step, step):
            value = actual_angle+sign*new_angle
            print("The servo {:d} is at angle: {:d}".format(servo_id, value))
            self.send("R{:02d}{:03d}".format(servo_id, value))
            self.angle[self.pin[servo_id]] = new_angle
            time.sleep(wait_time)

    def set_angles(self, angles: list):
        """
        Set the angle for all the servo at the same time
        
        Args:

            angles (list): List of length nb_servo where elements are list of len 4:
            [[servo_id, angle, step, wait_time],....]
        """
        
        if len(angles) < self.nb_servo:
            raise "Error too few element in the list"
        for angle in angles:
            if not (2 <= len(angle) <= 4):
                raise "Error too few element in the sub array"
            if self.angle[self.pin[angle[0]]] != angle[1]: # if the angle is different
                self.set_angle(angle[0], angle[1], angle[2], angle[3])
