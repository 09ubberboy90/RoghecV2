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
/*
 * Initialize all the timer and enable interupts
 */

void Interupt_Init(void);
void Timer0_Init(void);
void Timer1_Init(void);
void Timer3_Init(void);
/*
 * Main interupt routine
 * Curently handle 3 timer;
 */
void __interrupt() ISR_Control(void);    //Low priority interrupt

/**
 * Deprecated function for testing robot standing upward and or going straight
 * @param heading
 */

void Go_Straight(int heading);



#ifdef	__cplusplus
}
#endif

#endif	/* INTERUPTS_H */

