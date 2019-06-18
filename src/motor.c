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
#include "usb.h"
#include "usb_device_cdc.h"

void Motor_Init(void)
{
    Motor_Enable(MOTOR_A_F);
    Motor_Enable(MOTOR_A_R);
    Motor_Enable(MOTOR_B_F);
    Motor_Enable(MOTOR_B_R);

}

void Motor_Control(void)
{   
    uint8_t readBuffer[50];
    bool errorFlag = false;
    uint8_t numBytesRead = 0;
    uint8_t input[10];
    char mess[50];
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

    
    default:
        errorFlag = true;
        break;        
    }
    if (!errorFlag)
    {   
        result = (input[1]*10+input[2])-16;

        Speed_Control(result);   

        sprintf(mess,"Car is Moving : %u\r\n",result);
        putrsUSBUSART(mess);
    }
    else{
        sprintf(mess,"Erreur MOTOR\r\n");
        putrsUSBUSART(mess);
    }

    
}

void Motor_Forward(void)
{
    //Motor A forward
    Motor_On(MOTOR_A_F);
    Motor_Off(MOTOR_A_R);
    //Motor b forward
    Motor_On(MOTOR_B_F);
    Motor_Off(MOTOR_B_R);
}

void Motor_Backward(void)
{
    //Motor A Backward
    Motor_Off(MOTOR_A_F);
    Motor_On(MOTOR_A_R);
    //Motor b backward
    Motor_Off(MOTOR_B_F);
    Motor_On(MOTOR_B_R);


}

void Motor_Turn_Left(void)
{
    //Motor A forward
    Motor_On(MOTOR_A_F);
    Motor_Off(MOTOR_A_R);
    //Motor b backward
    Motor_Off(MOTOR_B_F);
    Motor_On(MOTOR_B_R);

}

void Motor_Turn_Right(void)
{
    //Motor A Backward
    Motor_Off(MOTOR_A_F);
    Motor_On(MOTOR_A_R);
    //Motor b forward
    Motor_On(MOTOR_B_F);
    Motor_Off(MOTOR_B_R);

}
void Speed_Control(char speed)
{
    Motor_A_Speed(speed);    
    Motor_B_Speed(speed);    

}
void Direct_Speed_Control(int8_t motorA_speed, int8_t motorB_speed)
{
    Motor_A_Direct_Speed(motorA_speed);    
    Motor_B_Direct_Speed(motorB_speed);    

}

