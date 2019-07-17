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

#ifndef SERVO_H
#define	SERVO_H

#include "io.h"
#include <xc.h>
#include <stdint.h>

#ifdef	__cplusplus
extern "C" {
#endif
extern bool message_display;

#define NB_OF_SERVO_1 6
#define NB_OF_SERVO_2 5

typedef struct {
    uint8_t nb_servo;
    uint8_t time[10]; //MUST BE IN 0.1ms : 2ms is written as 20 ; 1.5ms is written as 15;
    PIN pin[10];
}Servo_Pin_Control;

    
void Servo_Init(void);
Servo_Pin_Control * Get_Gesture(uint8_t index);
    
void Servo_Value(void);
void Servo_Control(void);


#ifdef	__cplusplus
}
#endif

#endif	/* SERVO_H */
