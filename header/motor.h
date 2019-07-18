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
#include <xc.h>
#include <stdint.h>

void Motor_Init(void);

void Motor_Control(void);

void Motor_Forward(void);

void Motor_Backward(void);

void Motor_Turn_Right(void);

void Motor_Turn_Left(void);

void Speed_Control(char speed);

void Direct_Speed_Control(int8_t motorA_speed, int8_t motorB_speed);


#ifdef	__cplusplus
}
#endif

#endif	/* MOTOR_H */

