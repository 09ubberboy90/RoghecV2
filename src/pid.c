/*
 * File:   pid.c
 * Author: audof
 *
 * Created on 18 juin 2019, 10:27
 */


#include <xc.h>
#include "motor.h"
#include "pid.h"

//#define DEAD_ZONE_DC_MOTOR 105          //125
//#define DEAD_ZONE_DC_MOTOR2 115         // 135
//#define DEAD_ZONE_DC_MOTOR_AV 130
//#define DEAD_ZONE_DC_MOTOR_AV2 140
//
//void Pid_Init (PIDMOTOR *pid_start_value, double pid_p, double pid_i, double pid_d)
//{
//    pid_start_value->P_factor = pid_p;
//    pid_start_value->I_factor = pid_i;
//    pid_start_value->D_factor = pid_d;
//    pid_start_value->previous_measur_value = 0.0;
//    pid_start_value->sum_error = 0.0;
//    pid_start_value->max_error_proportional = 9.0;				// Max error proportionnal
//    pid_start_value->max_sum_error_integral = 20.0;				// To avoid wind up
//}
//
//// Compute value to send to DC motor in order to stabilized the base
//float Pid_controller (PIDMOTOR *pid_value, float error_input_pid)
//{
//    float p_term = 0.0;
//    float i_term = 0.0;
//    float d_term = 0.0;
//    float output_PID = 0.0;
//
//    // Calculate proportional term and limit error overflow
//    if(error_input_pid > pid_value-> max_error_proportional)
//    {
//    	p_term = pid_value->P_factor * ERROR_ANGLE_VALUE;
//    }
//    else if (error_input_pid < -pid_value-> max_error_proportional)
//    {
//        p_term = pid_value->P_factor * (-ERROR_ANGLE_VALUE);
//    }
//    else
//        p_term = pid_value->P_factor * error_input_pid;
//
//    // Calculate integral term and limit integral wind-up
//    pid_value->sum_error += error_input_pid;
//    if (pid_value->sum_error > pid_value-> max_sum_error_integral)
//    {
//    	i_term = pid_value->I_factor * MAX_I_TERM;
//    }
//    else if (pid_value->sum_error < -pid_value-> max_sum_error_integral)
//    {
//    	i_term = pid_value->I_factor * (-MAX_I_TERM);
//    }
//    else
//        i_term = pid_value->I_factor * pid_value->sum_error;
//
//    // Calcul derivate term
//    d_term = pid_value->D_factor * (pid_value->previous_measur_value - error_input_pid);
//    pid_value->previous_measur_value = error_input_pid;
//
//    // Sum the values to get the PID controller
//    output_PID = p_term + i_term + d_term;
//    return output_PID;
//}
//
//void DC_motor_controller(float Value_PID)
//{
//    signed short duty_cycle = 0;
//
//    duty_cycle = Value_PID;
//    if((duty_cycle > 139) || (duty_cycle < -139))
//    {
//        CCPR1L = PR2;
//        CCPR2L = PR2;
//    }
//    else if(duty_cycle > 1.2)
//    {
//        LATAbits.LATA0 = 1;
//        LATAbits.LATA1 = 0;
//        LATAbits.LATA2 = 1;
//        LATAbits.LATA3 = 0;
//        CCPR1L = duty_cycle + DEAD_ZONE_DC_MOTOR;
//        CCPR2L = duty_cycle + DEAD_ZONE_DC_MOTOR2;
//        LATDbits.LATD0 = 1;              // Robot unstable
//        LATDbits.LATD1 = 0;
//        LATDbits.LATD2 = 0;
//    }
//    else if (duty_cycle < -1.2)
//    {
//        LATAbits.LATA0 = 0;
//        LATAbits.LATA1 = 1;
//        LATAbits.LATA2 = 0;
//        LATAbits.LATA3 = 1;
//        CCPR1L = -duty_cycle + DEAD_ZONE_DC_MOTOR_AV;
//        CCPR2L = -duty_cycle + DEAD_ZONE_DC_MOTOR_AV2;
//        LATDbits.LATD0 = 0;
//        LATDbits.LATD1 = 0;
//        LATDbits.LATD2 = 1;                 // Reaward Direction
//    }
//    else
//    {
//        CCPR1L =  0;
//        CCPR2L =  0;
//        LATDbits.LATD0 = 0;              // Robot Stable
//        LATDbits.LATD1 = 1;
//        LATDbits.LATD2 = 0;
//    }
//}
