/*
 * File:   interupts.c
 * Author: audof
 *
 * Created on 11 juin 2019, 16:04
 */


#include <xc.h>
#include "io.h"
#include "interupts.h"
#include "magnetometer.h"
#include "motor.h"

#include "usb.h"
#include "usb_device_cdc.h"
#include "usb_config.h"
#include <stdio.h>

void Timer1_Init()
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
}

void __interrupt(low_priority) HeadingControl()    //Low priority interrupt
{
    int array[2] = {0};
    if (INTCONbits.T0IF == 1) {
        int heading = 0;
        TMR0= -9523;	
//        int i = 0;
        heading = Magneto_Print_Value();
//        array[i%2] = heading;
//        i++;
//        int j;
//        int total=0;
//        for (j = 0; j < 20; j++)
//        {
//            total += array[j];
//        }
        Go_Straight(heading);
        INTCONbits.T0IF = 0;
    }

}

void Go_Straight(int heading)
{
    if (heading < 355 && heading >= 180)
    {
        Motor_Turn_Left();
        Speed_Control(60);   
    }
    else if (heading < 180 && heading > 5)
    {
        Motor_Turn_Right();
        Speed_Control(60);   
    }
    else
    {
        Motor_Forward();
        Speed_Control(70);   
    }

}
