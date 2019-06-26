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

void PWM1_setDC(unsigned int dutycycle,uint8_t channel);

void PWM_Start(uint8_t period,unsigned int dutycycle,uint8_t channel);

void Motor_A_Speed(uint8_t value);

void Motor_B_Speed(uint8_t value);

void Motor_A_Direct_Speed(uint8_t value);

void Motor_B_Direct_Speed(uint8_t value);
#ifdef	__cplusplus
}
#endif

#endif	/* PWM_H */

