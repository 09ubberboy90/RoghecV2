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

void MPU6050_Init(void);		/* Gyro initialization function */
float[] MPU_GetData(void);





#ifdef	__cplusplus
}
#endif

#endif	/* GYROSCOPE_H */

