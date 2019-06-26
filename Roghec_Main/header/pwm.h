/* 
 * File:   pwm.h
 * Author: audof
 *
 * Created on 5 juin 2019, 10:50
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

