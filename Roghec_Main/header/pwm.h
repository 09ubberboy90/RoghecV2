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

#ifndef PWM_H
#define	PWM_H

#ifdef	__cplusplus
extern "C" {
#endif
#include <xc.h>
#include <stdint.h>

void PWM_Init(unsigned char period,uint8_t channel);

void PWM_setDC(unsigned int dutycycle,uint8_t channel);

void PWM_Start(uint8_t period,unsigned int dutycycle,uint8_t channel);

void Motor_Speed(uint8_t value,uint8_t channel);

void Motor_Direct_Speed(uint8_t value,uint8_t channel);
#ifdef	__cplusplus
}
#endif

#endif	/* PWM_H */

