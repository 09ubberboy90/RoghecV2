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

//#include <math.h>		
#include <xc.h>
#include "i2c.h"
#include "gyroscope.h"
#include "system.h"
#include "io.h"
#include <stdio.h>
#include "usart.h"
uint8_t once = 0;
//static int OFFSET = 112;
char tmp[150];
gyro_data_offset data_offset;
#define _XTAL_FREQ 48000000
double zeroValue[3];
static gyro_data data;
void MPU_Init()		/* Gyro initialization function */
{
	//__delay_ms(150);		/* Power up time >100ms */
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

gyro_data * MPU_GetData()
{
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

    
    data.Xa = ((float)Ax/16384.0)*100;	
    data.Ya = ((float)Ay/16384.0)*100;
    data.Za = ((float)Az/16384.0)*100;
    data.Xg = ((float)Gx/131.0)*100;
    data.Yg = ((float)Gy/131.0)*100;
    data.Zg = ((float)Gz/131.0)*100;
    //data.Pitch = (int)(atan2(data.Xa,sqrt(data.Ya*data.Ya+data.Za*data.Za))*180/PI);
    //data.Pitch = 0;
    //data.Roll = (int)(atan2((double)data.Ya,(double)data.Za)*180/PI);
    //data.ComplPitch = (int)((0.93 * (data.Pitch - (data.Xg/100) * 0.012) + 0.07 * (data.Pitch))*100);
    //Pitch = data.Pitch;
    return &data;

}

gyro_data * MPU_getPointer()
{
    return &data;
}

void MPU_Setoffset()
{
    gyro_data *data;

    for (uint8_t i = 0; i < 100; i++) { // Take the average of 100 readings
        data = MPU_getPointer();
        zeroValue[0] += data->Xa;
        zeroValue[1] += data->Za;
        zeroValue[2] += data->Xg;
        uint8_t i;
        volatile uint16_t waste = 0;
        for (i = 0; i < 100; i++)
        {
            waste++;
        }

    }  
    zeroValue[0] /= 100;
    zeroValue[1] /= 100;
    zeroValue[2] /= 100;

}


void MPU_Print_Raw_Value()
{
    gyro_data *data = MPU_getPointer();

    // Whole Function takes 17ms
    //Getting the data takes 4 ms
    sprintf(tmp,"Gyroscope data : \r\n"
            "Xa: %d,"
            "Ya: %d,"
            "Za: %d,"
            "Xg: %d,"
            "Yg: %d,"
            "Zg: %d,"
            "Roll: %d,"
            "Pitch: %d,"
            "Complementary Pitch: %d,"
            "PID: %d\r\n",data->Xa,data->Ya,data->Za,data->Xg,data->Yg,data->Zg,
            data->Roll,data->Pitch,data->ComplPitch,data->PID);
    Send_Message(tmp);
}


