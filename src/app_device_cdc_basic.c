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

#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stddef.h>

#include "usb.h"
#include "app_device_cdc_basic.h"
#include "usb_config.h"
#include "io.h"
//#include "magnetometer.h"
#include "motor.h"
#include "gyroscope.h"
#include "servo.h"
#include "interupts.h"
#include "pid.h"
/** VARIABLES ******************************************************/

static uint8_t readBuffer[CDC_DATA_OUT_EP_SIZE];
uint16_t offset_Mag = 0;
uint16_t offset_MPU = 0;
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
void APP_DeviceCDCBasicDemoInitialize()
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
void APP_DeviceCDCBasicDemoTasks()
{

    /* If the USB device isn't configured yet, we can't really do anything
     * else since we don't have a host to talk to.  So jump back to the
     * top of the while loop. */
    if( USBGetDeviceState() < CONFIGURED_STATE )
    {
        return;
    }

    /* If we are currently suspended, then we need to see if we need to
     * issue a remote wakeup.  In either case, we shouldn't process any
     * keyboard commands since we aren't currently communicating to the host
     * thus just continue back to the start of the while loop. */
    if( USBIsDeviceSuspended()== true )
    {
        return;
    }
        
    if( USBUSARTIsTxTrfReady() == true)
    {
        uint8_t numBytesRead = 0;
        //numBytesRead = getsUSBUSART(readBuffer, sizeof(readBuffer));
        numBytesRead = getsUSBUSART(readBuffer, sizeof(readBuffer));
        char tmp[50];
        PIDMOTOR *pid;
        /* For every byte that was read... */
        if (numBytesRead != 0)
        {
            switch(readBuffer[0])
            {
            case 0x59: //Y
            case 0x79: //y
                Pid_Setup();
//                sprintf(tmp,"Heading = %d\r\n",Magneto_GetHeading(offset_Mag));
//                putrsUSBUSART(tmp);
                break;  

            case 0x4D: //M
            case 0x6D: //m
                T0CONbits.TMR0ON = 0; //stop the timer;
                sprintf(tmp,"Switched to manual Mode\r\n");
                putrsUSBUSART(tmp);

                break;
            case 0x41: //A
            case 0x61: //a
                T0CONbits.TMR0ON = 1; //start the timer;

                sprintf(tmp,"Switched to Auto Mode\r\n");
                putrsUSBUSART(tmp);

                break;
            case 0x44: //D 
            case 0x64: //d
                Motor_Control();
                break;
                
            case 0x52: //R 
            case 0x72: //r
                Servo_Control();
                break;

            // Base the offset on the current angle
            case 0x43: //c 
            case 0x63: //c
                //offset_Mag = Magneto_GetOffset();
                //MPU_Setoffset();
                
                //sprintf(tmp,"Offset of MPU set ");
                pid = Get_Pid();
                sprintf(tmp,"%d,%d,%d,%d,%d,%u,%u\r\n",pid->P_factor,pid->I_factor,pid->D_factor,pid->sum_error,pid->previous_measur_value,pid->MotorA_Speed,pid->MotorB_Speed);
                putrsUSBUSART(tmp);

                break;
                
            case 0x47: //G 
            case 0x67: //g
                
                MPU_Print_Raw_Value();
                break;

            default:
                putrsUSBUSART("ERROR main\n\r");
                break;
            }
        }
    }

    CDCTxService();
}

void Pid_Setup()
{   
    uint8_t readBuffer[50];
    uint8_t numBytesRead = 0;
    uint8_t input[10];
    char mess[50];
    uint16_t result;
    
    for (int i = 0; i < 3; i++)
    {
        do {
            numBytesRead = getsUSBUSART(readBuffer, sizeof(readBuffer));
        }
        while(numBytesRead==0);
        input[i] = readBuffer[0];

    }
    PIDMOTOR *pid = Get_Pid();
    result = ((input[0]-'0')*100+(input[1]-'0')*10+input[2]-'0');
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
    pid->P_factor = result;
    sprintf(mess,"Pid : %d,%d,%d\r\n",pid->P_factor,pid->I_factor,pid->D_factor);
    putrsUSBUSART(mess);


    
}