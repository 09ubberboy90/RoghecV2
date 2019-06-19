/*
 * File:   pid.c
 * Author: audof
 *
 * Created on 18 juin 2019, 10:27
 */


#include <xc.h>
#include "motor.h"
#include "pid.h"
#include "gyroscope.h"

#define DEAD_ZONE_DC_MOTOR_R 76          //125
#define DEAD_ZONE_DC_MOTOR_F 102
PIDMOTOR pid;

void Pid_Init (float pid_p, float pid_i, float pid_d)
{
    pid.P_factor = (int16_t)(pid_p*10);
    pid.I_factor = (int16_t)(pid_i*10);
    pid.D_factor = (int16_t)(pid_d*10);
    pid.previous_measur_value = 0;
    pid.sum_error = 0;
    pid.max_error_proportional = 90;				// Max error proportionnal
    pid.max_sum_error_integral = 200;				// To avoid wind up
}
PIDMOTOR * Get_Pid(void){
    return &pid;
}
// Compute value to send to DC motor in order to stabilized the base
int16_t Pid_controller (int16_t input)
{
    float p_term = 0;
    float i_term = 0;
    float d_term = 0;
    int16_t output_PID = 0;

    // Calculate proportional term and limit error overflow
    if(input/10 > pid. max_error_proportional/10)
    {
    	p_term = pid.P_factor/10 * ERROR_ANGLE_VALUE;
    }
    else if (input/10 < -pid.max_error_proportional/10)
    {
        p_term = pid.P_factor/10 * (-ERROR_ANGLE_VALUE);
    }
    else
        p_term = pid.P_factor/10 * input/10;

    // Calculate integral term and limit integral wind-up
    pid.sum_error += input;
    if (pid.sum_error/10 > pid.max_sum_error_integral/10)
    {
    	i_term = pid.I_factor/10 * MAX_I_TERM;
    }
    else if (pid.sum_error/10 < -pid.max_sum_error_integral/10)
    {
    	i_term = pid.I_factor/10 * (-MAX_I_TERM);
    }
    else
        i_term = pid.I_factor/10 * pid.sum_error/10;

    // Calcul derivate term
    d_term = pid.D_factor/10 * (pid.previous_measur_value/10 - input/10);
    pid.previous_measur_value = input;

    // Sum the values to get the PID controller
    output_PID = p_term + i_term + d_term;
    
    return (output_PID*10);
}

void DC_motor_controller(int16_t Value_PID)
{
    int16_t duty_cycle = 0;

    duty_cycle = (int16_t)(Value_PID/10+0.5); // take the ceiling
    pid.MotorB_Speed = duty_cycle;
    if(duty_cycle > 1.2)
    {
        Motor_Backward();
        pid.MotorA_Speed = duty_cycle;
        Direct_Speed_Control(duty_cycle + DEAD_ZONE_DC_MOTOR_F,duty_cycle + DEAD_ZONE_DC_MOTOR_F);   
    }
    else if (duty_cycle < -1.2)
    {
        Motor_Forward();
        pid.MotorA_Speed = duty_cycle;

        Direct_Speed_Control(-duty_cycle + DEAD_ZONE_DC_MOTOR_R,-duty_cycle + DEAD_ZONE_DC_MOTOR_R);   
    }
    else
    {
        Motor_Forward();
        Speed_Control(0);   

    }
}
