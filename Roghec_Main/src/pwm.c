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
