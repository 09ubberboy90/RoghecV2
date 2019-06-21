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
Servo_Pin_Control middle_mvt;
Servo_Pin_Control test_mvt;
Servo_Gesture gesture_list[NUMBER_OF_GESTURE]; 
uint8_t gesture_head = 0;
void Servo_Init()
{
    up_mvt.nb_servo = 2;
    PIN tmp_pin[2] = {LED_D1,LED_D2};
    memcpy(up_mvt.pin, tmp_pin,sizeof(tmp_pin));
    uint8_t tmp_time[2] =  {10,10};
    memcpy(up_mvt.time, tmp_time,sizeof(tmp_time));
    sprintf(gesture_list[0].name, "Hand Up");
    gesture_list[0].pin_control = up_mvt;

    down_mvt.nb_servo = 2;
    PIN tmp_pin1[2] =  {LED_D1,LED_D2};
    memcpy(down_mvt.pin, tmp_pin1,sizeof(tmp_pin1));
    uint8_t tmp_time1[2] =  {20,20};
    memcpy(down_mvt.time, tmp_time1,sizeof(tmp_time1));
    sprintf(gesture_list[1].name, "Hand Down");
    gesture_list[1].pin_control = down_mvt;

    middle_mvt.nb_servo = 2;
    PIN tmp_pin2[2] =  {LED_D1,LED_D2};
    memcpy(middle_mvt.pin, tmp_pin2,sizeof(tmp_pin2));
    uint8_t tmp_time2[2] =  {15,15};
    memcpy(middle_mvt.time, tmp_time2,sizeof(tmp_time2));
    sprintf(gesture_list[2].name, "Hand Middle");
    gesture_list[2].pin_control = middle_mvt;

    test_mvt.nb_servo = 2;
    PIN tmp_pin3[2] =  {LED_D1,LED_D2};
    memcpy(test_mvt.pin, tmp_pin3,sizeof(tmp_pin3));
    uint8_t tmp_time3[2] =  {5,25};
    memcpy(test_mvt.time, tmp_time3,sizeof(tmp_time3));
    sprintf(gesture_list[3].name, "Hand Test");
    gesture_list[3].pin_control = test_mvt;

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