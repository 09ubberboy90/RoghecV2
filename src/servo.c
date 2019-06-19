/*
 * File:   servo.c
 * Author: audof
 *
 * Created on 13 juin 2019, 10:32
 */


#include <xc.h>
#include "servo.h"
#include "interupts.h"
#include "usart.h"
#include <stdio.h>

extern int TimerTime;

void Servo_Control()
{
    uint8_t input[10];
    char mess[50];
    char result;
    
    for (int i = 0; i < 2; i++)
    {
        input[i] = USART_ReceiveChar();
    }
    result = (input[0]*10+input[1])-16;
    TimerTime = ((result*0.02)/100)/0.000000667; // Set the ration based on a 20ms period and a 48mhz clock with a 32 prescaler


    sprintf(mess,"Rotor Set : %u,%d\r\n",result,TimerTime);
    USART_SendString(mess);
}

