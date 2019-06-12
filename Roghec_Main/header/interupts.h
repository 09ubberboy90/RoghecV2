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
    

void Timer1_Init(void);
void __interrupt() HeadingControl(void);    //Low priority interrupt

void Go_Straight(int heading);



#ifdef	__cplusplus
}
#endif

#endif	/* INTERUPTS_H */

