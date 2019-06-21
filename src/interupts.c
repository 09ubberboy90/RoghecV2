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
#include "pid.h"
#include "usart.h"
#include "io_controller.h"
#include "servo.h"

static char out;
PIN actual_pin = LED_NONE;
int state = 0;

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
    // prescaler 1:64
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
    // prescaler 1:32
    TMR1 = -30000; // setup initial timer value
    PIR1bits.TMR1IF = 0; // reset timer interrupt flag
    PIE1bits.TMR1IE = 1; // enable timer interrupts
    //T1CONbits.TMR1ON = 1;
}

void Timer3_Init()
{
    T3CONbits.TMR3ON = 0; // stop the timer
    T3CONbits.RD16 = 1; // timer configured as 16-bit
    T3CONbits.TMR3CS = 0; // use system clock
    T3CONbits.T3CKPS = 0b11;
    // prescaler 1:32
    TMR3 = -3000; // setup initial timer value
    PIR2bits.TMR3IF = 0; // reset timer interrupt flag
    PIE2bits.TMR3IE = 1; // enable timer interrupts
    //T0CONbits.TMR0ON = 1;
}

void __interrupt(low_priority) ISR_Control() //Low priority interrupt
{
    Servo_Gesture *gesture = Get_Gesture();
    if (INTCONbits.TMR0IF == 1)
    {
        TMR0 = -9523; // set a 63 ms interupt for 
        gyro_data *data = MPU_getPointer();
        data->PID = Pid_controller(data->ComplPitch);
        DC_motor_controller(data->PID);
        //Go_Straight(heading);
        INTCONbits.TMR0IF = 0;
    }
    if (PIR1bits.TMR1IF == 1)
    {
        TMR1 = 30000; // Set a 20ms interupt for total time of the interupt 
        TMR3 = -gesture->pin_control.time[0]*150; // set a variable time of on time for timer3
        T3CONbits.TMR3ON = 1; //Enable third Timer;
        actual_pin = gesture->pin_control.pin[0];
        Motor_On(actual_pin);
        state = 1;
        PIR1bits.TMR1IF = 0;
    }
    if (PIR2bits.TMR3IF == 1)
    {
        Motor_Off(actual_pin);
        if (state <= gesture->pin_control.nb_servo)
        {
            TMR3 = -gesture->pin_control.time[0]*150; // set a variable time of on time for timer3
            actual_pin = gesture->pin_control.pin[state];
            Motor_On(actual_pin);
            state++;
        }
        else
        {
            actual_pin = LED_NONE;
            T3CONbits.TMR3ON = 0; //Disable third Timer;
            T1CONbits.TMR1ON = 0;
        }
        PIR2bits.TMR3IF = 0;
    }

}
//Deprecated
//void Go_Straight(gyro_data *data)
//{
//    if (data->ComplPitch < -800)
//    {
//        Motor_Forward();
//        Speed_Control(75);   
//    }
//    else if (data->ComplPitch > 800)
//    {
//        Motor_Backward();
//        Speed_Control(75);   
//    }
//    else
//    {
//        Motor_Forward();
//        Speed_Control(0);   
//    }
//}

