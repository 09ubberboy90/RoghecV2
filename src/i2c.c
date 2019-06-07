/*
 * File:   i2c.c
 * Author: audof
 *
 * Created on June 7, 2019, 10:04 AM
 */


#include "i2c.h"
#include <xc.h>
#include <stdint.h>

#define _XTAL_FREQ 48000000

void I2C_Init(const uint32_t clock)
{
    TRISB0 = 1; /* Set up I2C lines by setting as input */
    TRISB1 = 1;
    SSPSTAT = 0x80; /* Slew rate disabled, other bits are cleared */
    SSPCON1 = 0x28; /* Enable SSP port for I2C Master mode,
			clock = FOSC / (4 * (SSPADD+1))*/
    SSPCON2 = 0;
    SSPADD = (_XTAL_FREQ / (4 * clock)) - 1;
    ; /* Clock is whatever input in Hz */
    SSPIE = 1; /* Enable SSPIF interrupt */
    SSPIF = 0;
}

uint8_t I2C_Start()
{
    SSPCON2bits.SEN = 1; /* Send start pulse */
    while (SSPCON2bits.SEN); /* Wait for completion of start pulse */
    return I2C_Start_Helper();
}

void I2C_Start_Wait()
{
  while(1)
  {   
    if(I2C_Start())                    
    {
        I2C_Stop();                 /* If not then initiate STOP and continue */
        continue;
    }    
    break;                          /* If yes then break loop */
  }
}

uint8_t I2C_Repeated_Start()
{
    SSPCON2bits.RSEN = 1; /* Send start pulse */
    while (SSPCON2bits.RSEN); /* Wait for completion of start pulse */
    return I2C_Start_Helper();

}

uint8_t I2C_Start_Helper()
{
    SSPIF = 0;
    if (!SSPSTATbits.S) return 0; /* Return 0 to if start bit was detected last */
    //return (I2C_Write(slave_write_address)); /* Write slave device address
						//with write to communicate */

}
void I2C_Ready()
{
    while (BCLIF); /* Wait if bit collision interrupt flag is set*/

    /* Wait for Buffer full and read write flag*/
    while (SSPSTATbits.BF || (SSPSTATbits.R_W));
    SSPIF = 0; /* Clear SSPIF interrupt flag*/
}

uint8_t I2C_Write(uint8_t data)
{
    SSPBUF = data; /* Write data to SSPBUF*/
    I2C_Ready();
    if (ACKSTAT) /* Check for acknowledge bit*/
        return 1;
    else
        return 2;
}

uint8_t I2C_Stop()
{
    I2C_Ready();
    PEN = 1; /* Stop communication*/
    while (PEN); /* Wait for end of stop pulse*/
    SSPIF = 0;
    if (!SSPSTATbits.P) return 0; /* If not STOP detected last return 0 to indicate start failed*/
}

/* Read data from location and send ack or nack depending upon parameter*/

uint8_t I2C_Read()
{
    int buffer = 0;
    RCEN = 1; /* Enable receive */

    /* Wait for buffer full flag which when complete byte received */
    while (!SSPSTATbits.BF);
    buffer = SSPBUF; /* Copy SSPBUF to buffer */

    /* Send acknowledgment or negative acknowledgment after read to 
    continue or stop reading */
    I2C_Ack(0);
    I2C_Ready();
    return (buffer);
}

void I2C_Ack(uint8_t ack)
{
    ACKDT = ack; /* Acknowledge data 1:NACK,0:ACK */
    ACKEN = 1; /* Enable ACK to send */
    while (ACKEN);
}
