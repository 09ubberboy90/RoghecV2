/*
 * File:   gyroscope.c
 * Author: audof
 *
 * Created on 11 juin 2019, 13:18
 */


#include <xc.h>
#include "i2c.h"

 #define _XTAL_FREQ 480000000

void MPU6050_Init()		/* Gyro initialization function */
{
	__delay_ms(150)		/* Power up time >100ms */
	I2C_Start_Wait(0xD0);	/* Start with device write address */
	I2C_Write(SMPLRT_DIV);	/* Write to sample rate register */
	I2C_Write(0x07);	/* 1KHz sample rate */
	I2C_Stop();

	I2C_Start_Wait(0xD0);
	I2C_Write(PWR_MGMT_1);	/* Write to power management register */
	I2C_Write(0x01);	/* X axis gyroscope reference frequency */
	I2C_Stop();

	I2C_Start_Wait(0xD0);
	I2C_Write(CONFIG);	/* Write to Configuration register */
	I2C_Write(0x00);	/* Fs = 8KHz */
	I2C_Stop();

	I2C_Start_Wait(0xD0);
	I2C_Write(GYRO_CONFIG);	/* Write to Gyro configuration register */
	I2C_Write(0x18);	/* Full scale range +/- 2000 degree/C */
	I2C_Stop();

	I2C_Start_Wait(0xD0);
	I2C_Write(INT_ENABLE);	/* Write to interrupt enable register */
	I2C_Write(0x01);
	I2C_Stop();
}

float[] MPU_GetData()
{
    float data[6];
    int Ax,Ay,Az,T,Gx,Gy,Gz;

    I2C_Start_Wait(0xD0);	/* I2C start with device write address */
    I2C_Write(ACCEL_XOUT_H);/* Write start location address to read */ 
    I2C_Repeated_Start(0xD1);/* I2C start with device read address */

    Ax = (((int)I2C_Read(0)<<8) | (int)I2C_Read(0));
    Ay = (((int)I2C_Read(0)<<8) | (int)I2C_Read(0));
    Az = (((int)I2C_Read(0)<<8) | (int)I2C_Read(0));
    T = (((int)I2C_Read(0)<<8) | (int)I2C_Read(0));
    Gx = (((int)I2C_Read(0)<<8) | (int)I2C_Read(0));
    Gy = (((int)I2C_Read(0)<<8) | (int)I2C_Read(0));
    Gz = (((int)I2C_Read(0)<<8) | (int)I2C_Read(1));
    I2C_Stop();


    data[0] = (float)Ax/16384.0;							/* Divide raw value by sensitivity scale factor to get real values */
    data[1] = (float)Ay/16384.0;
    data[2] = (float)Az/16384.0;
    data[3] = (float)Gx/131.0;
    data[4] = (float)Gy/131.0;
    data[5] = (float)Gz/131.0;
    
    return data;
}
