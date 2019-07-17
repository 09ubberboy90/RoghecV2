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

#ifndef PID_H
#define	PID_H

#ifdef	__cplusplus
extern "C" {
#endif
#include <xc.h>
#include <stdint.h>

#define ERROR_ANGLE_VALUE 30.0 // AVOID TO GET A ERROR HIGHER THAN 50°
#define MAX_I_TERM 20.0 // AVOID WIND-UP

typedef struct
{
    int16_t max_error_proportional;				//
    int16_t max_sum_error_integral;
    int16_t sum_error;
    int16_t previous_measur_value;
    int16_t P_factor;
    int16_t I_factor;
    int16_t D_factor;
    uint8_t MotorA_Speed;
    uint8_t MotorB_Speed;
}PIDMOTOR;
PIDMOTOR * Get_Pid();
void Pid_Init (float pid_p, float pid_i, float pid_d);
int16_t Pid_controller (int16_t input);
void DC_motor_controller (int16_t Value_PID);


#ifdef	__cplusplus
}
#endif

#endif	/* PID_H */

