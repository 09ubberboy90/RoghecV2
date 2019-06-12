/*
 * File:   magnetometer.c
 * Author: audof
 *
 * Created on June 7, 2019, 10:03 AM
 */


#include <math.h>		
#include "i2c.h"
#include "magnetometer.h"
#include "usb.h"
#include "usb_device_cdc.h"
#include "usb_config.h"
#include <stdio.h>

uint8_t once = 0;
int offset;

void Magneto_init()								/* Magneto initialize function */
{
	I2C_Start(0x3C);							/* Start and write SLA+W */
	I2C_Write(0x00);							/* Write memory location address */
	I2C_Write(0x70);							/* Configure register A as 8-average, 15 Hz default, normal measurement */
	I2C_Write(0xA0);							/* Configure register B for gain */
	I2C_Write(0x00);							/* Configure continuous measurement mode in mode register */
	I2C_Stop();								/* Stop I2C */
}

int Magneto_GetHeading(int offset)                                    //Input an offset in degree
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
        return modulo(((int)(Heading*180/PI))-offset,360);
}
int Magneto_GetOffset()
{
    // No offset
    return Magneto_GetHeading(0);
}

int Magneto_Print_Value()
{
    int heading =0;
    if (once == 0)
    {
        offset = Magneto_GetOffset();
        once++;
    }

    char tmp[150];
    /* If the USB device isn't configured yet, we can't really do anything
     * else since we don't have a host to talk to.  So jump back to the
     * top of the while loop. */
    if( USBGetDeviceState() < CONFIGURED_STATE )
    {
        return -1;
    }

    /* If we are currently suspended, then we need to see if we need to
     * issue a remote wakeup.  In either case, we shouldn't process any
     * keyboard commands since we aren't currently communicating to the host
     * thus just continue back to the start of the while loop. */
    if(USBIsDeviceSuspended()== true )
    {
        return -1;
    }
    
    if(mUSBUSARTIsTxTrfReady() == true)
    {
        heading = Magneto_GetHeading(offset);

        sprintf(tmp,"Heading = %d,%d\r\n",heading,offset);
        putrsUSBUSART(tmp);
    }

    CDCTxService();

    return heading;
}

int modulo(int a, int b){
    return (a%b+b)%b;
}