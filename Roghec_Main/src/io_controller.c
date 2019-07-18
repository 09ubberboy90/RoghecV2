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

/** INCLUDES *******************************************************/
#include "system.h"

#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stddef.h>

#include "io_controller.h"
#include "io.h"
//#include "magnetometer.h"
#include "motor.h"
#include "gyroscope.h"
#include "servo.h"
#include "interupts.h"
#include "pid.h"
#include "system.h"

/** VARIABLES ******************************************************/

bool autoMode = false;

/*********************************************************************
 * Function: void APP_DeviceCDCBasicDemoInitialize(void);
 *
 * Overview: Initializes the demo code
 *
 * PreCondition: None
 *
 * Input: None
 *
 * Output: None
 *
 ********************************************************************/
void Io_Init()
{
    line_coding.bCharFormat = 0;
    line_coding.bDataBits = 8;
    line_coding.bParityType = 0;
    line_coding.dwDTERate = 9600;


}

/*********************************************************************
 * Function: void APP_DeviceCDCBasicDemoTasks(void);
 *
 * Overview: Keeps the demo running.
 *
 * PreCondition: The demo should have been initialized and started via
 *   the APP_DeviceCDCBasicDemoInitialize() and APP_DeviceCDCBasicDemoStart() demos
 *   respectively.
 *
 * Input: None
 *
 * Output: None
 *
 ********************************************************************/
void Io_Listener()
{
    uint8_t input[10];
    char tmp[50];

#ifdef USB_MODE
    /* If the USB device isn't configured yet, we can't really do anything
     * else since we don't have a host to talk to.  So jump back to the
     * top of the while loop. */
    if (USBGetDeviceState() < CONFIGURED_STATE)
    {
        return;
    }
    /* If we are currently suspended, then we need to see if we need to
     * issue a remote wakeup.  In either case, we shouldn't process any
     * keyboard commands since we aren't currently communicating to the host
     * thus just continue back to the start of the while loop. */
    if (USBIsDeviceSuspended() == true)
    {
        return;
    }

    if (USBUSARTIsTxTrfReady() == true)
    {
        uint8_t numBytesRead = 0;
        //numBytesRead = getsUSBUSART(readBuffer, sizeof(readBuffer));
        numBytesRead = getsUSBUSART(input, sizeof (input));

        /* For every byte that was read... */
        if (numBytesRead != 0)
        {
#endif
#ifdef BLUETOOTH_MODE
            input[0] = USART_ReceiveChar();
#endif

            switch (input[0])
            {
            case 0x50: //P
            case 0x70: //p
                Pid_Setup(1);
                break;
            case 0x49: //I
            case 0x69: //i
                Pid_Setup(2);
                break;
            case 0x59: //Y
            case 0x79: //y
                Pid_Setup(3);
                break;

            case 0x4D: //M
            case 0x6D: //m
                T0CONbits.TMR0ON = 0; //stop the timer;
                sprintf(tmp, "Switched to manual Mode\r\n");
                Send_Message(tmp);

                break;
            case 0x41: //A
            case 0x61: //a
                T0CONbits.TMR0ON = 1; //start the timer;
                sprintf(tmp, "Switched to Auto Mode\r\n");
                Send_Message(tmp);

                break;
            case 0x44: //D 
            case 0x64: //d
                Motor_Control();
                break;

            case 0x52: //R 
            case 0x72: //r
                Servo_Value();
                break;

            case 0x53: //S 
            case 0x73: //s
                Servo_Control();
                break;

                // Base the offset on the current angle
            case 0x43: //c 
            case 0x63: //c
            {
                PID_VALUE *pid = Get_PID();
                sprintf(tmp, "PID : %d,%d,%d\r\n", pid->P, pid->taui, pid->taud);
                Send_Message(tmp);
                break;
            }
            case 0x47: //G 
            case 0x67: //g
                MPU_Print_Raw_Value();
                break;

            case 0x56: //V
            case 0x76: //v
                break;
                
            case 0x4C:
            case 0x6C:
                Pin_Toggle(LED_D1);
                break;
            case 0x0D:
            case 0x0A:
                break;
            default:
                Send_Message("ERROR main\n\r");
                break;
            }
#ifdef USB_MODE
        }
    }
    CDCTxService();

#endif
}

void Pid_Setup(uint8_t choice)
{
    PID_VALUE *pid;
    pid = Get_PID();
    uint8_t input[10];
    char mess[50];
    uint16_t result;

#ifdef USB_MODE
    uint8_t numBytesRead = 0;
    uint8_t readBuffer[50];

    for (int i = 0; i < 2; i++)
    {
        do
        {
            numBytesRead = getsUSBUSART(readBuffer, sizeof (readBuffer));
        }
        while (numBytesRead == 0);
        input[i] = readBuffer[0];

    }
#endif
#ifdef BLUETOOTH_MODE
    for (int i = 0; i < 2; i++)
    {
        input[i] = USART_ReceiveChar();
    }
#endif
    result = ((input[0]-'0')*10+(input[1]-'0'));
    //    switch(input[0])
    //    {
    //        case 0x50:
    //        case 0x80:
    //            pid->P_factor = result;
    //            break;
    //        case 'I':
    //        case 'i':
    //            pid->I_factor = result;
    //            break;
    //        case 'D':
    //        case 'd':
    //            pid->D_factor = result;
    //            break;
    //        default:
    //            putrsUSBUSART("ERROR PID\n\r");
    //            break;
    //
    //    }
    if (choice == 1)
    {
        CorrecteurPID(10,result*1000,pid->taui,pid->taud,10);
    }
    else if (choice == 2)
    {
        CorrecteurPID(10,pid->P,result*1000,pid->taud,10);
    }
    else if (choice == 3)
    {
        CorrecteurPID(10,pid->P,pid->taui,result*1000,10);
    }
    sprintf(mess, "PID : %d,%d,%d\r\n", pid->P, pid->taui, pid->taud);
    Send_Message(mess);
}