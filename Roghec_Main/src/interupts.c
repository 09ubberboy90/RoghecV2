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


#include <xc.h>
#include "io.h"
#include "interupts.h"
#include "system.h"
#include "usb_device.h"

static char out;
STATE_MACHINE state_1 = STATE_OFF;
STATE_MACHINE state_2 = STATE_ON;
uint8_t servo_id_1 = 0;
uint16_t tmp_time_1 = 0;
uint8_t servo_id_2 = 0;
uint16_t tmp_time_2 = 0;

void Interupt_Init()
{
    INTCONbits.PEIE = 1; // enable peripheral interrupts
    INTCONbits.GIE = 1; // enable interrupts globally
    //Timer0_Init();
    Timer1_Init();
    //Timer2_Init();
    Timer3_Init();
}

//void Timer0_Init()
//{
//    T0CONbits.TMR0ON = 0; // stop the timer
//    T0CONbits.T08BIT = 0; // timer configured as 16-bit
//    T0CONbits.T0CS = 0; // use system clock
//    T0CONbits.PSA = 0; // use prescaler
//    T0CONbits.T0PS = 0b111;
//    // prescaler 1:8
//    TMR0 = -9523; // setup initial timer value
//    INTCONbits.TMR0IF = 0; // reset timer interrupt flag
//    INTCONbits.TMR0IE = 1; // enable timer interrupts
//    RCONbits.IPEN = 1; // use priorities
//    //T0CONbits.TMR0ON = 1;
//}

void Timer1_Init()
{
    T1CONbits.TMR1ON = 0; // stop the timer
    //T1CONbits.RD16 = 1; // timer configured as 16-bit
    T1CONbits.TMR1CS = 0; // use system clock
    T1CONbits.T1CKPS = 0b11;
    // prescaler 1:8
    TMR1 = 65535-30000; // setup initial timer value
    PIR1bits.TMR1IF = 0; // reset timer interrupt flag
    PIE1bits.TMR1IE = 1; // enable timer interrupts
    //T1CONbits.TMR1ON = 1;
}

//void Timer2_Init()
//{
//    T2CONbits.TMR2ON = 0; // stop the timer
//    T2CONbits.T2CKPS = 0b01; 
//    // prescaler 1:4
//    TMR2 = -255; // setup initial timer value
//    PIR1bits.TMR2IF = 0; // reset timer interrupt flag
//    PIE1bits.TMR2IE = 1; // enable timer interrupts
//    //T0CONbits.TMR0ON = 1;
//}
//

void Timer3_Init()
{
    T3CONbits.TMR3ON = 0; // stop the timer
    T3CONbits.TMR3CS = 0; // use system clock
    T3CONbits.T3CKPS = 0b11;
    // prescaler 1:32
    TMR3 = 65535-30000; // setup initial timer value
    PIR2bits.TMR3IF = 0; // reset timer interrupt flag
    PIE2bits.TMR3IE = 1; // enable timer interrupts
    //T0CONbits.TMR0ON = 1;
}
void __interrupt(low_priority) ISR_Control() //Low priority interrupt
{
    if(PIE3bits.USBIE == 1 && PIR3bits.USBIF == 1)
    {
        USBDeviceTasks();
    } 
    if (PIR1bits.TMR1IF == 1) // Set the period of pwm
    {
        Servo_Pin_Control *gesture = Get_Gesture(1);
        State_Controller(gesture,&state_1,&servo_id_1,&tmp_time_1,1);
        PIR1bits.TMR1IF = 0; // reset interupt flag
    }
    if (PIR2bits.TMR3IF == 1) // Set the period of pwm
    {        
        Servo_Pin_Control *gesture = Get_Gesture(2);
        State_Controller(gesture,&state_2,&servo_id_2,&tmp_time_2,2);
        PIR2bits.TMR3IF = 0; // reset timer interrupt flag
    }

}
void State_Controller(Servo_Pin_Control *gesture,STATE_MACHINE *state,uint8_t *servo_id,uint16_t *tmp_time,uint8_t index)
{
    switch(*state)
    {
    case STATE_ON:
        Pin_Off(gesture->pin[*servo_id]);
        //tmp_time = PWM_MIN_TIME*150 - (gesture->time[servo_id]*16.6+750);
        *tmp_time = PWM_MIN_TIME - gesture->time[*servo_id];

        *servo_id = *servo_id + 1;
        if (*tmp_time>0) // if pin was needed to be on for less than what was supposed to wait
        {
            Timer_Assignment(*tmp_time,index);

//                TMR1H = (tmp_time&0xFF00)>>8;
//                TMR1L = (tmp_time&0x00FF);
            *state = STATE_OFF;
            break; 
        }
        //else no need for break directly go into off state 
        //implicitly set state to off and hence start the next servo
        //although no need to do it since it would mean to wait for another interupt;
    case STATE_OFF: // If you're off then it means you can start a new led if there is one;
        if (*servo_id < gesture->nb_servo)// if there's still some Led turn them on and restart the process
        {
            //tmp_time = (gesture->time[servo_id]*16.6+750);
            *tmp_time = gesture->time[*servo_id];
            Timer_Assignment(*tmp_time,index);
//                TMR1H = (tmp_time&0xFF00)>>8;
//                TMR1L = (tmp_time&0x00FF);
            Pin_On(gesture->pin[*servo_id]);
            *state = STATE_ON;
            break;
        }
        //else no need to wait for another interupt fall into waiting state 
        //and wait for whatever amount of time is left
    case STATE_WAITING:
        *tmp_time = PWM_PERIOD-gesture->nb_servo*PWM_MIN_TIME;
        
        Timer_Assignment(*tmp_time,index);
//            TMR1H = (tmp_time&0xFF00)>>8;
//            TMR1L = (tmp_time&0x00FF);

        *state = STATE_OFF;
        *servo_id = 0;
        break;
    }
}

void Timer_Assignment(uint16_t time,uint8_t index)
{
    if (index == 1)
    {
        TMR1 = 65535-(time);
    }
    else
    {
        TMR3 = 65535-(time);
    }

}