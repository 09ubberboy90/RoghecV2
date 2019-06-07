/*
 * File:   magnetometer.c
 * Author: audof
 *
 * Created on June 7, 2019, 10:03 AM
 */


#include <math.h>		
#include "i2c.h"
#include "magnetometer.h"

signed long X_axis = 0; 
signed long Y_axis = 0;                                  
signed long Z_axis = 0; 
float m_scale = 1.0;     


void HMC5883L_init() 
{                                        
   HMC5883L_write(Config_Reg_A, 0x70); 
   HMC5883L_write(Config_Reg_B, 0xA0); 
   HMC5883L_write(Mode_Reg, 0x00);  
} 
                                    

unsigned char HMC5883L_read(unsigned char reg) 
{                                          
   unsigned char val = 0; 
    
   I2C_Start(); 
   I2C_Write(HMC5883L_WRITE_ADDR); 
   I2C_Write(reg); 
   I2C_Start(); 
   I2C_Write(HMC5883L_READ_ADDR); 
   val = I2C_Read();                        
   I2C_Stop(); 
   return(val);    
} 

                                  
void HMC5883L_write(unsigned char reg_address, unsigned char value) 
{ 
   I2C_Start(); 
   I2C_Write(HMC5883L_WRITE_ADDR); 
   I2C_Write(reg_address); 
   I2C_Write(value); 
   I2C_Stop(); 
}                                            
      
void HMC5883L_read_data() 
{                          
   unsigned char lsb = 0; 
   unsigned char msb = 0; 
    
   I2C_Start(); 
   I2C_Write(HMC5883L_WRITE_ADDR); 
   I2C_Write(X_MSB_Reg);            
   I2C_Start(); 
   I2C_Write(HMC5883L_READ_ADDR); 
    
   msb = I2C_Read(); 
   lsb = I2C_Read(); 
   X_axis = make_word(msb, lsb); 
                           
   msb = I2C_Read(); 
   lsb = I2C_Read(); 
   Z_axis = make_word(msb, lsb); 
                   
   msb = I2C_Read(); 
   lsb = I2C_Read(); 
   Y_axis = make_word(msb, lsb);            
                       
   I2C_Stop();    
} 



                                
float HMC5883L_heading()          
{ 
   register float heading = 0.0; 
    
   HMC5883L_read_data(); 
   heading = atan2(Y_axis, X_axis); 
    heading += Declination;    
                  
    if(heading < 0.0) 
    { 
      heading += (2.0 * PI); 
    } 
    
    if(heading > (2.0 * PI))                
    {                            
      heading -= (2.0 * PI); 
    }                    
                    
   heading *= (180.0 / PI); 
                   
   return heading; 
}              

unsigned long make_word(unsigned char HB, unsigned char LB) 
{                                      
   register unsigned long val = 0; 
                               
   val = HB; 
   val <<= 8;                          
   val |= LB;          
   return val; 
} 