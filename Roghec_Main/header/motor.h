/* 
 * File:   motor.h
 * Author: audof
 *
 * Created on 11 juin 2019, 09:20
 */

#ifndef MOTOR_H
#define	MOTOR_H

#ifdef	__cplusplus
extern "C" {
#endif
#include <stdbool.h>
#include <stddef.h>

void Motor_Init(void);

void Motor_Control();

void Motor_Forward(void);

void Motor_Backward(void);

void Motor_Turn_Right(void);

void Motor_Turn_Left(void);


#ifdef	__cplusplus
}
#endif

#endif	/* MOTOR_H */

