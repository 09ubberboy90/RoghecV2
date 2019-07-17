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

#ifndef I2C_H
#define	I2C_H

#ifdef	__cplusplus
extern "C" {
#endif
#include <xc.h>
#include <stdint.h>

#define F_OSC 48000000                   /* Define F_OSC, here it's 8 MHz */
#define I2C_CLOCK 400000                /* I2C clock frequency is 100 kHz*/
#define BITRATE ((F_OSC/(4*I2C_CLOCK))-1) /* find bit rate to assign this value to SSPADD register*/

void I2C_Ready(void);                       /* Check weather I2C is ready/idle or not */
void I2C_Init(void);                        /* Initialize I2C configuration*/
char I2C_Start(char);                   /* Send START pulse with slave device write address */
void I2C_Start_Wait(char);              /* Send START pulse with slave device write address until acknowledgement */
char I2C_Repeated_Start(char);          /* Send REPEATED START pulse with slave device read address*/
char I2C_Stop(void);                        /* Send STOP pulse*/
char I2C_Write(unsigned char);          /* Write data/address to slave device */
void I2C_Ack(void);                         /* Send acknowledge to slave for continue read */
void I2C_Nack(void);                        /* Send negative acknowledge to slave for stop current communication */
char I2C_Read(char);                    /* Read data from slave devices with 0=Ack & 1=Nack */

#ifdef	__cplusplus
}
#endif

#endif	/* I2C_H */

