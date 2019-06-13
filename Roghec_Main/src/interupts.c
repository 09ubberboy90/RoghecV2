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

void Timer0_Init()
{
    T0CONbits.TMR0ON = 0; // stop the timer
    T0CONbits.T08BIT = 0; // timer configured as 16-bit
    T0CONbits.T0CS = 0; // use system clock
    T0CONbits.PSA = 0; // use prescaler
    T0CONbits.T0PS = 0b111;
    // prescaler 1:256 (?0b? is a prefix for binary)
    TMR0 = -9523; // setup initial timer value
    INTCONbits.T0IF = 0; // reset timer interrupt flag
    INTCONbits.T0IE = 1; // enable timer interrupts
    RCONbits.IPEN = 1; // use priorities
    INTCONbits.PEIE = 1; // enable peripheral interrupts
    INTCONbits.GIE = 1; // enable interrupts globally
    //T0CONbits.TMR0ON = 1;
}

void __interrupt(low_priority) HeadingControl()    //Low priority interrupt
{
    if (INTCONbits.T0IF == 1) {
        int heading = 0;
        TMR0= -9523;	
        heading = MPU_Print_Value();
        Go_Straight(heading);
        INTCONbits.T0IF = 0;
    }
//    if (PIR1bits.TMR1IF == 1) {
//        int heading = 0;
//        TMR0= -251;	
//        heading = MPU_Print_Value();
//        Go_Straight(heading);
//        PIR1bits.TMR1IF = 0;
//    }


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
