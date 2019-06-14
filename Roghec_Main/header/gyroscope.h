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
#include <xc.h>
#include <stdint.h>

    
#define PI	3.14159265359	/* Define Pi value */

typedef struct gyro_data{
    int16_t Xa;
    int16_t Ya;
    int16_t Za;
    int16_t Xg;
    int16_t Yg;
    int16_t Zg;
    int16_t Roll;
    int16_t Pitch;
    int16_t Yaw;
    int8_t Roll_offset;
    int8_t Pitch_offset;
    int8_t Yaw_offset;
} gyro_data;

void MPU_Init(void);		/* Gyro initialization function */

/**
 * Return the offseted data from the gyroscope/accelerometer
 * @param offset is based on which value is sent 
 * @param value Which value we are interested in based on the enum
 * @return struct
 */
gyro_data MPU_GetData(void);
/**
 * Set the offset of the sensor based on which value is asked
 * @return 
 */
void MPU_Setoffset(void);
/**
 * Print the values of sensor to serial;
 * Could be switch to a struct too
 * @return struct
 */
gyro_data MPU_Print_Raw_Value(void);

void UsbReady(char message[]);

#ifdef	__cplusplus
}
#endif

#endif	/* GYROSCOPE_H */

