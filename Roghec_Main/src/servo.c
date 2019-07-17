/*
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

*/


#include <xc.h>
#include "servo.h"
#include "interupts.h"
#include <stdio.h>
#include <string.h>
#include "io.h"
#include "system.h"
Servo_Pin_Control mvt_tmr_1;
Servo_Pin_Control mvt_tmr_2;
uint8_t servo_nb = 0;

void Servo_Init()
{
    mvt_tmr_1.nb_servo = NB_OF_SERVO_1;
    
    PIN tmp_pin[NB_OF_SERVO_1] = {SERVO_1, SERVO_2, SERVO_3, SERVO_4, SERVO_5, SERVO_6};
    memcpy(mvt_tmr_1.pin, tmp_pin, sizeof (tmp_pin));
    //float tmp_time[NB_OF_SERVO] = {90, 90, 90, 90, 90, 90};
    uint16_t tmp_time[NB_OF_SERVO_1] = {2250, 2250, 2250, 2250, 2250, 2250};
    memcpy(mvt_tmr_1.time, tmp_time, sizeof (tmp_time));
    
    
    mvt_tmr_2.nb_servo = NB_OF_SERVO_2;
    
    PIN tmp_pin_2[NB_OF_SERVO_2] = {SERVO_7, SERVO_8, SERVO_9, SERVO_10, SERVO_11};
    memcpy(mvt_tmr_2.pin, tmp_pin_2, sizeof (tmp_pin_2));
    //float tmp_time[NB_OF_SERVO] = {90, 90, 90, 90, 90, 90};
    uint16_t tmp_time_2[NB_OF_SERVO_2] = {2250, 2250, 2250, 2250, 2250};
    memcpy(mvt_tmr_2.time, tmp_time_2, sizeof (tmp_time_2));

}
void Servo_Value()
{
    uint8_t input[5];
    uint16_t result;
    char mess[37];
    bool error_flag = false;
    #ifdef USB_MODE
        uint8_t numBytesRead = 0;
        uint8_t readBuffer[50];

        for (int i = 0; i < 5; i++)
        {
            do {
                numBytesRead = getsUSBUSART(readBuffer, sizeof(readBuffer));
            }
            while(numBytesRead==0);
            input[i] = readBuffer[0];
            if (input[i]< '0' || input[i] > '9')
            {
                error_flag = true;
                break;
            }
        }
    #endif
    #ifdef BLUETOOTH_MODE
        for (int i = 0; i < 5; i++)
        {
            input[i] = USART_ReceiveChar();
            if (input[i]< '0' || input[i] > '9')
            {
                error_flag = true;
                break;
            }
        }
    #endif
    if (!error_flag)
    {
        result = (uint16_t)((input[2] - 0x30)*100 + (input[3] - 0x30)*10+(input[4] - 0x30))*16.6+750;
        input[0] = (uint8_t) input[0] - 0x30;
        input[1] = (uint8_t) input[1] - 0x30;
        servo_nb = input[0]*10+input[1];
        if (result >= 750 && result <= 3750 && servo_nb > 0 && servo_nb <= 12) // Prevent error based on wrong timing
        {
            if (servo_nb <= 6)
            {
                T1CONbits.TMR1ON = 0; // stop the timer
                mvt_tmr_1.time[servo_nb-1] = result;
                T1CONbits.TMR1ON = 1; // stop the timer
            }
            if (servo_nb > 6)
            {
                T3CONbits.TMR3ON = 0; // stop the timer
                mvt_tmr_2.time[servo_nb-7] = result;
                T3CONbits.TMR3ON = 1; // stop the timer
            }
            sprintf(mess, "%s set with %*u clock cycles\r\n", pin_name[servo_nb+5],4, result);
        }
        else
        {
            error_flag = true;
        }
    }
    if (error_flag)
    {
        sprintf(mess, "Error Rotor\r\n");
        error_flag = false;
    }
    Send_Message(mess);
}

Servo_Pin_Control * Get_Gesture(uint8_t index)
{
    if (index == 1)
    {
        return &mvt_tmr_1;
    }
    else if ( index == 2)
    {
        return &mvt_tmr_2;
    }
}
void Servo_Control(){
    uint8_t input[10];
#ifdef USB_MODE
    uint8_t numBytesRead = 0;
    //numBytesRead = getsUSBUSART(readBuffer, sizeof(readBuffer));
    do
    {
        numBytesRead = getsUSBUSART(input, sizeof (input));
    }
    while (numBytesRead == 0);

    /* For every byte that was read... */
    if (numBytesRead != 0)
    {
#endif
#ifdef BLUETOOTH_MODE
        input[0] = USART_ReceiveChar();
#endif
        switch (input[0])
        {
        case 0x45://E
        case 0x65://e
            T1CONbits.TMR1ON = 1;
            T3CONbits.TMR3ON = 1;
            Send_Message("Servo Enabled\r\n");
            break;
        case 0x44://D
        case 0x64://d
            T1CONbits.TMR1ON = 0;
            T3CONbits.TMR3ON = 0;
            Send_Message("Servo Disabled\r\n");
            break;
        case 0x53://S
        case 0x73://s
            Send_Message("Message Disable\r\n");
            message_display = false;
            break;
        case 0x56://V
        case 0x76://v
            Send_Message("Message Enable\r\n");
            message_display = true;
            break;

        default:
            Send_Message("Error Servo\r\n");
            break;
        }

#ifdef USB_MODE
        }

#endif

}
