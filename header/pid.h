/* 
 * File:   pid.h
 * Author: audof
 *
 * Created on 18 juin 2019, 10:27
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

