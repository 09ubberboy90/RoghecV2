/*
 * File:   motor.c
 * Author: audof
 *
 * Created on 11 juin 2019, 09:19
 */


#include <xc.h>
#include <stdint.h>
#include <stdio.h>
#include <stddef.h>
#include <stdbool.h>
#include "motor.h"
#include "io.h"
#include "pwm.h"
#include "system.h"

void Motor_Init(void)
{
    Pin_Enable(MOTOR_A_F);
    Pin_Enable(MOTOR_A_R);
    Pin_Enable(MOTOR_B_F);
    Pin_Enable(MOTOR_B_R);
}
void Motor_Control(void)
{   
    bool errorFlag = false;
    bool speedFlag = false;
    uint8_t input[10];
    char mess[50];
    char result;
#ifdef USB_MODE
    uint8_t numBytesRead = 0;
    uint8_t readBuffer[50];

    for (int i = 0; i < 3; i++)
    {
        do {
            numBytesRead = getsUSBUSART(readBuffer, sizeof(readBuffer));
        }
        while(numBytesRead==0);
        input[i] = readBuffer[0];

    }
#endif
#ifdef BLUETOOTH_MODE
    for (int i = 0; i < 3; i++)
    {
        input[i] = USART_ReceiveChar();
    }
#endif
    result = (input[1]*10+input[2])-16;
    switch(input[0])
    {
    case 0x46://F
    case 0x66://f
        Motor_Forward();
        break;
    case 0x42://B
    case 0x62://b
        Motor_Backward();
        break;
    case 0x4C://L
    case 0x6C: //l
        Motor_Turn_Left();
        break;
    case 0x52://R
    case 0x72://r
        Motor_Turn_Right();
        break;
    case 0x31://1
        Motor_Forward();
        speedFlag = true;
        Motor_Speed(result,1);    

        break;
    case 0x32://2
        Motor_Forward();
        speedFlag = true;
        Motor_Speed(result,2);
        break;

    
    default:
        errorFlag = true;
        break;        
    }
    if (!errorFlag)
    {   
        if (!speedFlag)
        {
            Speed_Control(result);
        }
        sprintf(mess,"Car is Moving : %u\r\n",result);
//        putrsUSBUSART(mess);
    }
    else{
        sprintf(mess,"Erreur MOTOR\r\n");
//        putrsUSBUSART(mess);
    }
    Send_Message(mess);

    
}

void Motor_Forward(void)
{
    //Motor A forward
    Pin_On(MOTOR_A_F);
    Pin_Off(MOTOR_A_R);
    //Motor b forward
    Pin_On(MOTOR_B_F);
    Pin_Off(MOTOR_B_R);
}

void Motor_Backward(void)
{
    //Motor A Backward
    Pin_Off(MOTOR_A_F);
    Pin_On(MOTOR_A_R);
    //Motor b backward
    Pin_Off(MOTOR_B_F);
    Pin_On(MOTOR_B_R);


}

void Motor_Turn_Left(void)
{
    //Motor A forward
    Pin_Off(MOTOR_A_F);
    Pin_On(MOTOR_A_R);
    //Motor b backward
    Pin_On(MOTOR_B_F);
    Pin_Off(MOTOR_B_R);

}

void Motor_Turn_Right(void)
{
    //Motor A Backward
    Pin_On(MOTOR_A_F);
    Pin_Off(MOTOR_A_R);
    //Motor b forward
    Pin_Off(MOTOR_B_F);
    Pin_On(MOTOR_B_R);

}
void Speed_Control(char speed)
{
    Motor_Speed(speed,1);    
    Motor_Speed(speed,2);    
}
void Direct_Speed_Control(int8_t motorA_speed, int8_t motorB_speed)
{
    Motor_Direct_Speed(motorA_speed,1);    
    Motor_Direct_Speed(motorB_speed,2);    

}

