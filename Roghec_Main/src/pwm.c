/*
 * File:   pwm.c
 * Author: audof
 *
 * Created on 5 juin 2019, 10:50
 */


#include "pwm.h"

void PWM_Init(unsigned char frequency,uint8_t channel){
    //frequency control need to be implemented
    //  PWM mode ( CCP1M3:CCP1M0 = 1100)
    CCP1M3 = 1;
    CCP1M2 = 1;

    if(channel == 1){
        TRISC1 = 0;
    }
    if(channel == 2){
        TRISC2 = 0; 
    }       
    TMR2ON = 0;
    TMR2 = 0;
    PR2 = frequency;           //  configure timer2 period
    T2CON = 0x02;           //  Set prescalar 16   
    TMR2ON = 1;             //  timer2 on
    
}

void PWM_setDC(unsigned int dutycycle,uint8_t channel){
    
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
    PWM_setDC(dutycycle,channel);
 }

void Motor_Speed(uint8_t value,uint8_t channel)
{
    uint8_t frequency = 255; //2.9kHz
    PWM_Start(frequency,(value*frequency)/100,channel);
}
void Motor_Direct_Speed(uint8_t value,uint8_t channel)
{
    uint8_t frequency = 255; //2.9kHz
    PWM_Start(frequency,value,channel);
}
