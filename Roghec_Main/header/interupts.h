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
#ifndef INTERUPTS_H
#define	INTERUPTS_H

#ifdef	__cplusplus
extern "C" {
#endif
/*
 * Initialize all the timer and enable interupts
 */
    typedef enum{
    STATE_ON,
    STATE_WAITING,
    STATE_OFF
}STATE_MACHINE;
#include "servo.h"

#define PWM_MIN_TIME 3750 // 2.5ms
#define PWM_PERIOD 30000 // 20ms
// both value are based on the clock speed and the conversion from angle to time
#define HARD_MULTIPLE 16.65
#define HARD_SUM 750 //
void Interupt_Init(void);
void Timer0_Init(void);
void Timer1_Init(void);
//void Timer2_Init(void);
void Timer3_Init(void);

/*
 * Main interupt routine
 * Curently handle 2 timer;
 */
void __interrupt() ISR_Control(void);    //Low priority interrupt

void State_Controller(Servo_Pin_Control *gesture,STATE_MACHINE *state,uint8_t *servo_id,uint16_t *tmp_time,uint8_t index);
void Timer_Assignment(uint16_t time,uint8_t index);

#ifdef	__cplusplus
}
#endif

#endif	/* INTERUPTS_H */

