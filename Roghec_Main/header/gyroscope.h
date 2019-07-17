/*
Copyright(c) 2019 Florent Audonnet: audoflo63@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files(the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

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
    int16_t ComplPitch;
    int16_t PID;
} gyro_data;

typedef struct gyro_data_offset{
    int8_t Roll_offset;
    int8_t Pitch_offset;
    int8_t Yaw_offset;
} gyro_data_offset;

void MPU_Init(void);		/* Gyro initialization function */

/**
 * Return the offseted data from the gyroscope/accelerometer
 * @param offset is based on which value is sent 
 * @param value Which value we are interested in based on the enum
 * @return struct
 */
gyro_data * MPU_GetData(void);
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
void MPU_Print_Raw_Value(void);

void UsbReady(char message[]);
gyro_data * MPU_getPointer(void);

#ifdef	__cplusplus
}
#endif

#endif	/* GYROSCOPE_H */

