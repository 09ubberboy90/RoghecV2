/*
 * File:   interupts.c
 * Author: audof
 *
 * Created on 11 juin 2019, 16:04
 */


#include <xc.h>
#include "io.h"
#include "interupts.h"
#include "gyroscope.h"
#include "motor.h"

#include "usb.h"
#include "usb_device_cdc.h"
#include "usb_config.h"
#include <stdio.h>

int TimerTime = 3000;

void Interupt_Init()
{
    INTCONbits.PEIE = 1; // enable peripheral interrupts
    INTCONbits.GIE = 1; // enable interrupts globally
    Timer0_Init();
    Timer1_Init();
    Timer3_Init();
}

void Timer0_Init()
{
    T0CONbits.TMR0ON = 0; // stop the timer
    T0CONbits.T08BIT = 0; // timer configured as 16-bit
    T0CONbits.T0CS = 0; // use system clock
    T0CONbits.PSA = 0; // use prescaler
    T0CONbits.T0PS = 0b111;
    // prescaler 1:256 (?0b? is a prefix for binary)
    TMR0 = -9523; // setup initial timer value
    INTCONbits.TMR0IF = 0; // reset timer interrupt flag
    INTCONbits.TMR0IE = 1; // enable timer interrupts
    RCONbits.IPEN = 1; // use priorities
    INTCONbits.PEIE = 1; // enable peripheral interrupts
    INTCONbits.GIE = 1; // enable interrupts globally
    //T0CONbits.TMR0ON = 1;
}
void Timer1_Init()
{
    T1CONbits.TMR1ON = 0; // stop the timer
    T1CONbits.RD16 = 1; // timer configured as 16-bit
    T1CONbits.TMR1CS = 0; // use system clock
    T1CONbits.T1CKPS = 0b11;
    // prescaler 1:256 (?0b? is a prefix for binary)
    TMR1 = -30000; // setup initial timer value
    PIR1bits.TMR1IF = 0; // reset timer interrupt flag
    PIE1bits.TMR1IE = 1; // enable timer interrupts
    T1CONbits.TMR1ON = 1;
}
void Timer3_Init()
{
    T3CONbits.TMR3ON = 0; // stop the timer
    T3CONbits.RD16 = 1; // timer configured as 16-bit
    T3CONbits.TMR3CS = 0; // use system clock
    T3CONbits.T3CKPS = 0b11;
    // prescaler 1:256 (?0b? is a prefix for binary)
    TMR3 = -3000; // setup initial timer value
    PIR2bits.TMR3IF = 0; // reset timer interrupt flag
    PIE2bits.TMR3IE = 1; // enable timer interrupts
    //T0CONbits.TMR0ON = 1;
}


void __interrupt(low_priority) ISR_Control()    //Low priority interrupt
{
    if (INTCONbits.TMR0IF == 1) {
        int heading = 0;
        TMR0= -9523;	
        heading = MPU_Print_Value();
        Go_Straight(heading);
        INTCONbits.TMR0IF = 0;
    }
    if (PIR1bits.TMR1IF == 1) {
        TMR1= -30000;	
        TMR3 = -TimerTime;
        T3CONbits.TMR3ON = 1; //Enable Second Timer;
        Motor_On(LED_D1);
        PIR1bits.TMR1IF = 0;
    }
    if (PIR2bits.TMR3IF == 1) {
        Motor_Off(LED_D1);
        T3CONbits.TMR3ON = 0; //Enable Second Timer;
        PIR2bits.TMR3IF = 0;
    }

}

void Go_Straight(int heading)
{
    if (heading < 0)
    {
        Motor_Backward();
        Speed_Control(75);   
    }
    else if (heading > 0)
    {
        Motor_Forward();
        Speed_Control(75);   
    }
    else{
        Speed_Control(00);   

    }

}
