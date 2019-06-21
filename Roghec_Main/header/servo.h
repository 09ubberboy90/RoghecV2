/* 
 * File:   servo.h
 * Author: audof
 *
 * Created on 13 juin 2019, 10:32
 */

#ifndef SERVO_H
#define	SERVO_H

#include "io.h"
#include <xc.h>
#include <stdint.h>

#ifdef	__cplusplus
extern "C" {
#endif
    
#define NUMBER_OF_GESTURE 2
typedef struct {
    uint8_t nb_servo;
    uint8_t time[10];
    PIN pin[10];
}Servo_Pin_Control;

typedef struct {
    Servo_Pin_Control pin_control;
    char name[20];
}Servo_Gesture;
    
void Servo_Init(void);
Servo_Gesture * Get_Gesture(void);
    
void Servo_Control(void);


#ifdef	__cplusplus
}
#endif

#endif	/* SERVO_H */

