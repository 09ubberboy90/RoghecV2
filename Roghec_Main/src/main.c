/*******************************************************************************
Copyright 2016 Microchip Technology Inc. (www.microchip.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

To request to license the code under the MLA license (www.microchip.com/mla_license), 
please contact mla_licensing@microchip.com
*******************************************************************************/

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
    Pid_Init(0,0,0);
    while(1)
    {
        #ifdef USB_MODE
            SYSTEM_Tasks();
            USBDeviceTasks();
        #endif
        if (T0CONbits.TMR0ON)
        {
            gyro_data *tmp_data = MPU_GetData(); // only get data if on auto mode
            tmp_data->Pitch = (int)(atan2(tmp_data->Xa,sqrt(tmp_data->Ya*tmp_data->Ya+tmp_data->Za*tmp_data->Za))*180/PI);
            tmp_data->ComplPitch = (int)((0.98 * (tmp_data->ComplPitch/100 + (tmp_data->Xg/100) * 0.012) + 0.02 * (tmp_data->Pitch))*100);
        }

        //Application specific tasks
        Io_Listener();
        
    }//end while
}//end main

/*******************************************************************************
 End of File
*/
