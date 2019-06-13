/* 
 * File:   gyroscope.h
 * Author: audof
 *
 * Created on 11 juin 2019, 13:18
 */

#ifndef GYROSCOPE_H
#define	GYROSCOPE_H

#ifdef	__cplusplus
extern "C" {
#endif
#define GYRO_CONFIG 0x1B
#define INT_ENABLE 0x38
#define CONFIG 0x1A
#define PWR_MGMT_1 0x6B
#define SMPLRT_DIV 0x19
#define ACCEL_XOUT_H 0x3B
#define USER_CTRL 0x6A

    
#define PI	3.14159265359	/* Define Pi value */

void MPU_Init(void);		/* Gyro initialization function */
int MPU_GetData(int offset);
int MPU_Getoffset(void);
int MPU_Print_Value(void);




#ifdef	__cplusplus
}
#endif

#endif	/* GYROSCOPE_H */

