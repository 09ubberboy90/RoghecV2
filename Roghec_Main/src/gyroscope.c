/*
 * File:   gyroscope.c
 * Author: audof
 *
 * Created on 11 juin 2019, 13:18
 */

#include <math.h>		
#include <xc.h>
#include "i2c.h"
#include "gyroscope.h"

#define _XTAL_FREQ 48000000
void MPU_Init()		/* Gyro initialization function */
{
	__delay_ms(150);		/* Power up time >100ms */
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
	I2C_Write(USER_CTRL);	
	I2C_Write(0x80);	
	I2C_Stop();

}

int MPU_GetData(int offset)
{
    int Ax,Ay,Az,T,Gx,Gy,Gz;
    float Xa,Ya,Za,t,Xg,Yg,Zg;

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


    Xa = (float)Ax/16384.0;	
    Ya = (float)Ay/16384.0;
    Za = (float)Az/16384.0;
    Xg = (float)Gx/131.0;
    Yg = (float)Gy/131.0;
    Zg = (float)Gz/131.0;
    
    return ((int)(atan2((double)Ya,(double)Za)*180/PI)-offset)%(int)360;
}

int MPU_Getoffset()
{
    return MPU_GetData(0);
}
