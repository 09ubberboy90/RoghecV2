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

#ifndef IO_H
#define IO_H

#include <stdbool.h>

/** Type defintions *********************************/
typedef enum
{
    PIN_FIRST, // DO NOT USE ONLY USED FOR LOOPING KEEP FIRST
    LED_NONE,
    LED_D1,
    LED_D2,
    MOTOR_A_F,
    MOTOR_A_R,
    MOTOR_B_F,
    MOTOR_B_R,
    SERVO_1,
    SERVO_2,
    SERVO_3,
    SERVO_4,
    SERVO_5,
    SERVO_6,
    SERVO_7,
    SERVO_8,
    SERVO_9,
    SERVO_10,
    SERVO_11,
    PIN_LAST // DO NOT USE ONLY USED FOR LOOPING KEEP LAST  
} PIN;
const char* pin_name[] = {"PIN_FIRST","LED_NONE","MOTOR_A_F","MOTOR_A_R","MOTOR_B_F","MOTOR_B_R","SERVO_1","SERVO_2","SERVO_3","SERVO_4","SERVO_5","SERVO_6","SERVO_7","SERVO_8","SERVO_9","SERVO_10","SERVO_11","PIN_LAST"};
void Pin_Init(void);

void Pin_On(PIN motor);

void Pin_Off(PIN motor);

void Pin_Toggle(PIN motor);

bool Pin_Get(PIN motor);

void Pin_Enable(PIN motor);

#endif //LEDS_H
