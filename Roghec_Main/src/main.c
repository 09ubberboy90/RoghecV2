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

#include "app_device_cdc_basic.h"
#include "app_led_usb_status.h"
#include <stdio.h>

#include "usb.h"
#include "usb_device.h"
#include "usb_device_cdc.h"
#include "pwm.h"
#include "i2c.h"
//#include "magnetometer.h"
#include "motor.h"
#include "gyroscope.h"
#include "interupts.h"
#include "pid.h"
#include <math.h>
/********************************************************************
 * Function:        void main(void)
 *
 * PreCondition:    None
 *
 * Input:           None
 *
 * Output:          None
 *
 * Side Effects:    None
 *
 * Overview:        Main program entry point.
 *
 * Note:            None
 *******************************************************************/
MAIN_RETURN main(void)
{
    Motor_Enable(LED_D1);
    I2C_Init(); 
    Motor_Init();
    MPU_Init();
    //Magneto_init(); 
    Interupt_Init();
    SYSTEM_Initialize(SYSTEM_STATE_USB_START);
    USBDeviceInit();
    USBDeviceAttach();
    Pid_Init(0,0,0);
    APP_DeviceCDCBasicDemoInitialize();
    while(1)
    {
        SYSTEM_Tasks();
        
        #if defined(USB_POLLING)
            // Interrupt or polling method.  If using polling, must call
            // this function periodically.  This function will take care
            // of processing and responding to SETUP transactions
            // (such as during the enumeration process when you first
            // plug in).  USB hosts require that USB devices should accept
            // and process SETUP packets in a timely fashion.  Therefore,
            // when using polling, this function should be called
            // regularly (such as once every 1.8ms or faster** [see
            // inline code comments in usb_device.c for explanation when
            // "or faster" applies])  In most cases, the USBDeviceTasks()
            // function does not take very long to execute (ex: <100
            // instruction cycles) before it returns.
            USBDeviceTasks();
        #endif
        if (T0CONbits.TMR0ON)
        {
            gyro_data *tmp_data = MPU_GetData(); // only get data if on auto mode
            tmp_data->Pitch = (int)(atan2(tmp_data->Xa,sqrt(tmp_data->Ya*tmp_data->Ya+tmp_data->Za*tmp_data->Za))*180/PI);
            tmp_data->ComplPitch = (int)((0.98 * (tmp_data->ComplPitch/100 + (tmp_data->Xg/100) * 0.012) + 0.02 * (tmp_data->Pitch))*100);
        }

        //Application specific tasks
        APP_DeviceCDCBasicDemoTasks();
        
    }//end while
}//end main

/*******************************************************************************
 End of File
*/
