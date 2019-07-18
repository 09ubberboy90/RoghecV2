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



float numerateur[3];
float denominateur[3];
float mem_output[3];
float mem_input[3];

typedef struct{
    float P;
    float taui;
    float taud;
} PID_VALUE;
    
PID_VALUE * Get_PID(void);
void CorrecteurPID(float te,
              float P,
              float taui,
              float taud,
              float Nd);
float compute(float input);
void Print_PID_Values();
#ifdef	__cplusplus
}
#endif

#endif	/* PID_H */

