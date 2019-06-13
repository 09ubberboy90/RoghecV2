/*
 * File:   servo.c
 * Author: audof
 *
 * Created on 13 juin 2019, 10:32
 */


#include <xc.h>
#include "servo.h"
#include "interupts.h"
#include "usb.h"
#include "usb_device_cdc.h"
#include <stdio.h>
#include <stddef.h>
#include <stdbool.h>

extern int TimerTime;

void Servo_Control()
{
    uint8_t readBuffer[50];
    bool errorFlag = false;
    uint8_t numBytesRead = 0;
    uint8_t input[10];
    char mess[50];
    char result;
    
    for (int i = 0; i < 2; i++)
    {
        do {
            numBytesRead = getsUSBUSART(readBuffer, sizeof(readBuffer));
        }
        while(numBytesRead==0);
        input[i] = readBuffer[0];

    }
    result = (input[0]*10+input[1])-16;
    TimerTime = ((result*0.02)/100)/0.000000667;


    sprintf(mess,"Rotor Set : %u,%d\r\n",result,TimerTime);
    putrsUSBUSART(mess);

}

