/*
 * File:   pwm.c
 * Author: audof
 *
 * Created on 5 juin 2019, 10:50
 */


#include "pwm.h"

void PWM_Init(unsigned char frequency,uint8_t channel){
    //frequency control need to be implemented
    if(channel == 1){
        TRISC2 = 0;
        CCP1M3 = 1;
        CCP1M2 = 1;
    }
    if(channel == 2){
        TRISC1 = 0; 
        CCP2M3 = 1;
        CCP2M2 = 1;
    }       //  PWM mode ( CCP1M3:CCP1M0 = 1100)
    /* Timer2 configuration */
    while (TMR2ON !=1)
    {
        PR2 = frequency;           //  configure timer2 period
        T2CON = 0x02;           //  Set prescalar 16   
        TMR2ON = 1;             //  timer2 on
    }
}

void PWM1_setDC(unsigned int dutycycle,uint8_t channel){
    
    if(channel == 1){
        CCP1CON = 0x0C;	/* Set PWM mode and no decimal for PWM */    
        CCPR1L = dutycycle;
    }
    if(channel == 2){
        CCP2CON = 0x0C;	/* Set PWM mode and no decimal for PWM */    
        CCPR2L = dutycycle;

    }
}

void PWM_Start(uint8_t frequency,unsigned int dutycycle,uint8_t channel)
 {
    PWM_Init(frequency,channel);
    
    /*set duty cycle 0 - 1023 range */
    PWM1_setDC(dutycycle,channel);
 }

void Motor_A_Speed(uint8_t value)
{
    uint8_t frequency = 255; //2.9kHz
    PWM_Start(frequency,(value*frequency)/100,1);
}

void Motor_B_Speed(uint8_t value)
{
    uint8_t frequency = 255; //2.9kHz
    PWM_Start(frequency,(value*frequency)/100,2);
}
void Motor_A_Direct_Speed(uint8_t value)
{
    uint8_t frequency = 255; //2.9kHz
    PWM_Start(frequency,value,1);
}

void Motor_B_Direct_Speed(uint8_t value)
{
    uint8_t frequency = 255; //2.9kHz
    PWM_Start(frequency,value,2);
}