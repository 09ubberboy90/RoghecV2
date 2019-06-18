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

#define ERROR_ANGLE_VALUE 30.0 // AVOID TO GET A ERROR HIGHER THAN 50°
#define MAX_I_TERM 20.0 // AVOID WIND-UP

//typedef struct
//{
//    float max_error_proportional;				//
//    float max_sum_error_integral;
//    float sum_error;
//    float previous_measur_value;
//    float P_factor;
//    float I_factor;
//    float D_factor;
//}PIDMOTOR;
//
//void Pid_Init (PIDMOTOR *pid_start_value, double pid_p, double pid_i, double pid_d);
//float Pid_controller (PIDMOTOR *pid_value, float error_input_pid);
//void DC_motor_controller (float Value_PID);


#ifdef	__cplusplus
}
#endif

#endif	/* PID_H */

