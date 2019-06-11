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
#include "adc.h"
#include "app_led_usb_status.h"
#include "app_device_cdc_basic.h"
#include "usb_config.h"
#include "io.h"
#include "pwm.h"
#include "i2c.h"
#include "magnetometer.h"
#include "motor.h"

/** VARIABLES ******************************************************/

static bool buttonPressed;
static char buttonMessage[] = "Button pressed.\r\n";
static uint8_t readBuffer[CDC_DATA_OUT_EP_SIZE];
static uint8_t writeBuffer[CDC_DATA_IN_EP_SIZE];

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

    buttonPressed = false;


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

        /* For every byte that was read... */
        if (numBytesRead != 0)
        {
            switch(readBuffer[0])
            {
            // Decrepit only use for testing purposes
            case 0x6D:
            case 0x4E: //M
                Old_Motor_Control();
                break;
            // Decrepit only use for testing purposes
            case 0x50:
            case 0x70: //P
                Adc_Read_Send();
                break;
            // Decrepit only use for testing purposes
            case 0x57:
            case 0x77: //W
                Pwm_Control();
                break;
                
            case 0x41:
            case 0x61: //A
                sprintf(tmp,"Heading = %d%c\r\n",Magneto_GetHeading(),0xDF);
                putrsUSBUSART(tmp);
            
                break;  
            case 0x44: //D 
            case 0x64: //D
                Motor_Control();
                break;

            default:
                putrsUSBUSART("ERROR main\n\r");
                break;
            }
        }
    }

    CDCTxService();
}
// Decrepit only use for testing purposes
void Adc_Read_Send()
{
    uint16_t value = 0;
    char tmp[50];
    value = ADC_GetConversion(0);
    sprintf(tmp,"The potentiometer has a value of : %d\r\n",value);
    putrsUSBUSART(tmp);
}


//Decrepit Only use for testing purposes
void Old_Motor_Control()
{   
    bool errorFlag = false;
    int8_t state = -1;
    uint8_t numBytesRead = 0;
    uint8_t input[10];
    char mess[50];

    for (int i = 0; i < 2; i++)
    {
        do {
            numBytesRead = getsUSBUSART(readBuffer, sizeof(readBuffer));
        }
        while(numBytesRead==0);
        input[i] = readBuffer[0];

    }


    switch(input[0])
    {
    case 0x41://A
    case 0x61://a
        state = Direction_Control(input[1]);
        if (state == 1)
        {
            Motor_On(MOTOR_A_F);
            Motor_Off(MOTOR_A_R);

        }
        else if (state == 0)
        {
            Motor_On(MOTOR_A_R);
            Motor_Off(MOTOR_A_F);

        }
        else{
            errorFlag = true;
        }
        break;
    case 0x42://B
    case 0x62://b
        state = Direction_Control(input[1]);
        if (state == 1)
        {
            Motor_On(MOTOR_B_F);
            Motor_Off(MOTOR_B_R);
        }
        else if (state == 0)
        {
            Motor_On(MOTOR_B_R);
            Motor_Off(MOTOR_B_F);
        }
        else{
            errorFlag = true;
        }
        break;
    default:
        errorFlag = true;
        break;        
    }
    if (!errorFlag)
    {   
        sprintf(mess,"MOTOR %c is in direction : %s\r\n",(char)input[0],(state)?"Forward":"Backward");
        putrsUSBUSART(mess);
    }
    else{
        sprintf(mess,"Erreur MOTOR %i \r\n",state);
        putrsUSBUSART(mess);
    }

    
}

// Decrepit only use for testing purposes

int8_t Direction_Control(uint8_t input){
    int8_t state = -1;
    switch(input)
    {
    case 0x46://F
    case 0x66: //f
        state = 1;
        break;
    case 0x52://R
    case 0x72://r
        state = 0;
        break;
    default:
        putrsUSBUSART("ERROR MOTOR DIRECTION\n\r");
        break;        
    } 
    return state;
}
// Decrepit only use for testing purposes

void Pwm_Control(){
    uint8_t numBytesRead = 0;
    char tmp[50];
    uint8_t input[10];
    char result;
    for (int i = 0; i < 3; i++)
    {
        do {
            numBytesRead = getsUSBUSART(readBuffer, sizeof(readBuffer));
        }
        while(numBytesRead==0);
        input[i] = readBuffer[0];

    }
    switch(input[0])
    {
    case 0x41://A
    case 0x61://b
        result = (input[1]*10+input[2])-16;
        Motor_A_Speed(result);    
        break;
    case 0x42://A
    case 0x62://b
        result = (input[1]*10+input[2])-16;
        Motor_B_Speed(result);    
        break;
    default:
        putrsUSBUSART("ERROR PWM\n\r");
        break;        
    }
    sprintf(tmp,"Pwm is set @ :%u \n\r",result);
    putrsUSBUSART(tmp);

}
