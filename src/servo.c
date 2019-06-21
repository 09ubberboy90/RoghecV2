/*
 * File:   servo.c
 * Author: audof
 *
 * Created on 13 juin 2019, 10:32
 */


#include <xc.h>
#include "servo.h"
#include "interupts.h"
#include "usart.h"
#include <stdio.h>
#include <string.h>

Servo_Pin_Control up_mvt;
Servo_Pin_Control down_mvt;
Servo_Gesture gesture_list[NUMBER_OF_GESTURE]; 
uint8_t gesture_head = 0;
void Servo_Init()
{
    up_mvt.nb_servo = 2;
    PIN tmp_pin[2] = {LED_D1,LED_D2};
    memcpy(up_mvt.pin, tmp_pin,sizeof(tmp_pin));
    uint8_t tmp_time[2] =  {15,15};
    memcpy(up_mvt.time, tmp_time,sizeof(tmp_time));
    down_mvt.nb_servo = 2;
    PIN tmp_pin1[2] =  {LED_D2,LED_D2};
    memcpy(down_mvt.pin, tmp_pin1,sizeof(tmp_pin1));
    uint8_t tmp_time1[2] =  {15,15};
    memcpy(down_mvt.time, tmp_time1,sizeof(tmp_time1));
    sprintf(gesture_list[0].name, "Hand Up");
    gesture_list[0].pin_control = up_mvt;
    sprintf(gesture_list[1].name, "Hand Down");
    gesture_list[1].pin_control = down_mvt;

}
void Servo_Control()
{
    uint8_t input;
    char mess[50];
    input = USART_ReceiveChar();        
    if(input >= '0' && input <= '9' )
    {
        gesture_head = (int)input-'0'-1;
        T1CONbits.TMR1ON = 1;
        sprintf(mess,"Rotor Set with motion %s,%u\r\n",gesture_list[gesture_head].name,gesture_head);
    }
    else{
        sprintf(mess,"Error Rotor\r\n");
    }
    USART_SendString(mess);

}

Servo_Gesture * Get_Gesture(void)
{
    return &gesture_list[gesture_head];
}