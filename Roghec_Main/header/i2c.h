/* 
 * File:   i2c.h
 * Author: audof
 *
 * Created on June 7, 2019, 10:04 AM
 */

#ifndef I2C_H
#define	I2C_H

#ifdef	__cplusplus
extern "C" {
#endif
#include <xc.h>
#include <stdint.h>


void I2C_Init(const uint32_t clock);

uint8_t I2C_Start( );

uint8_t I2C_Repeated_Start();

uint8_t I2C_Start_Helper();

void I2C_Start_Wait();

void I2C_Ready();

uint8_t I2C_Write(uint8_t data);

uint8_t I2C_Stop();

uint8_t I2C_Read();

void I2C_Ack(uint8_t ack);


#ifdef	__cplusplus
}
#endif

#endif	/* I2C_H */

