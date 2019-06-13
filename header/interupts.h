/* 
 * File:   interupts.h
 * Author: audof
 *
 * Created on 11 juin 2019, 16:04
 */

#ifndef INTERUPTS_H
#define	INTERUPTS_H

#ifdef	__cplusplus
extern "C" {
#endif

void Interupt_Init(void);
void Timer0_Init(void);
void Timer1_Init(void);
void Timer3_Init(void);
void __interrupt() ISR_Control(void);    //Low priority interrupt

void Go_Straight(int heading);



#ifdef	__cplusplus
}
#endif

#endif	/* INTERUPTS_H */

