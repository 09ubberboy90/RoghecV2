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
#include <stdio.h>

#include "pwm.h"
#include "i2c.h"
//#include "magnetometer.h"
#include "motor.h"
#include "gyroscope.h"
#include "interupts.h"
#include "pid.h"
#include "servo.h"
#include <math.h>
#include "io_controller.h"
void main(void)
{
    Pin_Init();
    Servo_Init();
    I2C_Init(); 
    Motor_Init();
    MPU_Init();
    //Magneto_init(); 
    CorrecteurPID(0.01,1,1e6,0,10);
    Interupt_Init();
    #ifdef USB_MODE
    SYSTEM_Initialize(SYSTEM_STATE_USB_START);
    USBDeviceInit();
    USBDeviceAttach();
    Io_Init();
    #endif
    #ifdef BLUETOOTH_MODE
    // SPBRGH1 4; 
    SPBRGH1 = 0x04;
     // SCS FOSC; IDLEN disabled; IRCF 16MHz; 
    OSCCON = 0x70;
    // INTSRC INTRC_31_25KHz; PLLEN disabled; PRISD disabled; SOSCGO disabled; 
    OSCCON2 = 0x00;
    // SPLLMULT 3xPLL; TUN 0; 
    OSCTUNE = 0x80;
    // ACTSRC SOSC; ACTUD enabled; ACTEN disabled; 
    ACTCON = 0x00;

    USART_Init();
    #endif
    while(1)
    {
        if (T0CONbits.TMR0ON)
        {
            gyro_data *tmp_data = MPU_GetData(); // only get data if on auto mode
            tmp_data->Pitch = (int)(atan2(tmp_data->Xa,sqrt(tmp_data->Ya*tmp_data->Ya+tmp_data->Za*tmp_data->Za))*180/PI);
            tmp_data->ComplPitch = (int)((0.98 * (tmp_data->ComplPitch/100 + (tmp_data->Xg/100) * 0.012) + 0.02 * (tmp_data->Pitch))*100);
        }     
        Io_Listener();

    }//end while
}//end main

/*******************************************************************************
 End of File
*/
