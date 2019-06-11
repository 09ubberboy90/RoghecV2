/*
 * File:   magnetometer.c
 * Author: audof
 *
 * Created on June 7, 2019, 10:03 AM
 */


#include <math.h>		
#include "i2c.h"
#include "magnetometer.h"

void Magneto_init()								/* Magneto initialize function */
{
	I2C_Start(0x3C);							/* Start and write SLA+W */
	I2C_Write(0x00);							/* Write memory location address */
	I2C_Write(0x70);							/* Configure register A as 8-average, 15 Hz default, normal measurement */
	I2C_Write(0xA0);							/* Configure register B for gain */
	I2C_Write(0x00);							/* Configure continuous measurement mode in mode register */
	I2C_Stop();								/* Stop I2C */
}

uint16_t Magneto_GetHeading(uint16_t offset)                                    //Input an offset in degree
{
	int x, y, z;
	double Heading;
	I2C_Start_Wait(0x3C);							/* Start and wait for acknowledgment */
	I2C_Write(0x03);                                                        /* Write memory location address */
	I2C_Repeated_Start(0x3D);						/* Generate repeat start condition with SLA+R */
	/* Read 16 bit x,y,z value (2?s complement form) */
	x = (((int)I2C_Read(0)<<8) | (int)I2C_Read(0));
	z = (((int)I2C_Read(0)<<8) | (int)I2C_Read(0));
	y = (((int)I2C_Read(0)<<8) | (int)I2C_Read(1));
	I2C_Stop();								/* Stop I2C */
	Heading = atan2((double)y,(double)x) + Declination;
	if (Heading>2*PI)							/* Due to declination check for >360 degree */
		Heading = Heading - 2*PI;
	if (Heading<0)								/* Check for sign */
		Heading = Heading + 2*PI;
	return ((uint16_t)(Heading* 180 / PI));					/* Convert into angle and return */
}
uint16_t Magneto_GetOffset()
{
    // No offset
    return Magneto_GetHeading(0);
}
