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
extern bool message_display;

#define NB_OF_SERVO_1 6
#define NB_OF_SERVO_2 5

typedef struct {
    uint8_t nb_servo;
    uint8_t time[10]; //MUST BE IN 0.1ms : 2ms is written as 20 ; 1.5ms is written as 15;
    PIN pin[10];
}Servo_Pin_Control;

    
void Servo_Init(void);
Servo_Pin_Control * Get_Gesture(uint8_t index);
    
void Servo_Value(void);
void Servo_Control(void);


#ifdef	__cplusplus
}
#endif

#endif	/* SERVO_H */
