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
#include "usart.h"
/** VARIABLES ******************************************************/


void Bluetooth_Controller()
{
    char tmp[50];
    PIDMOTOR *pid;
    uint8_t data_in=USART_ReceiveChar();
    /* For every byte that was read... */
    switch(data_in)
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
        sprintf(tmp,"Switched to manual Mode\r\n");
        USART_SendString(tmp);

        break;
    case 0x41: //A
    case 0x61: //a
        T0CONbits.TMR0ON = 1; //start the timer;
        sprintf(tmp,"Switched to Auto Mode\r\n");
        USART_SendString(tmp);

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
        pid = Get_Pid();
        sprintf(tmp,"%d,%d,%d,%d,%d,%u,%u\r\n",pid->P_factor/10,pid->I_factor/10,pid->D_factor/10,pid->sum_error,pid->previous_measur_value,pid->MotorA_Speed,pid->MotorB_Speed);
        USART_SendString(tmp);
        break;
        
    case 0x47: //G 
    case 0x67: //g
        MPU_Print_Raw_Value();
        break;
        
    case 0x0D:
    case 0x0A:
        break;
    default:
        USART_SendString("ERROR main\n\r");
        break;
    }
    
}

void Pid_Setup(uint8_t choice)
{   
    uint8_t tmp;
    uint8_t input[10];
    char mess[50];
    uint16_t result;
    
    for (int i = 0; i < 2; i++)
    {
        input[i] = USART_ReceiveChar();
    }
    PIDMOTOR *pid = Get_Pid();
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
        pid->P_factor = result*10;
    }
    else if (choice == 2)
    {
        pid->I_factor = result*10;
    }
    else if (choice == 3)
    {
        pid->D_factor = result*10;
    }

    sprintf(mess,"Pid : %d,%d,%d\r\n",pid->P_factor/10,pid->I_factor/10,pid->D_factor/10);
    USART_SendString(mess);

    
}