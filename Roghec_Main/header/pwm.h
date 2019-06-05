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

void PWMinit(void);
uint16_t Forward_Dir(uint8_t value);
uint16_t Reverse_Dir(uint8_t value);
uint16_t hex2int(char *hex);


#ifdef	__cplusplus
}
#endif

#endif	/* PWM_H */

