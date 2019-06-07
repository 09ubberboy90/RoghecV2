/* 
 * File:   magnetometer.h
 * Author: audof
 *
 * Created on June 7, 2019, 10:04 AM
 */

#ifndef MAGNETOMETER_H
#define	MAGNETOMETER_H

#ifdef	__cplusplus
extern "C" {
#endif
#define PI	3.14159265359	/* Define Pi value */
#define Declination	0.02007/* Define declination of location from where measurement going to be done. */

#define HMC5883L_READ_ADDR       0x3D 
#define HMC5883L_WRITE_ADDR      0x3C 
                            
#define Config_Reg_A             0x00 
#define Config_Reg_B             0x01 
#define Mode_Reg                 0x02 
#define X_MSB_Reg                0x03 
#define X_LSB_Reg                0x04 
#define Z_MSB_Reg                0x05 
#define Z_LSB_Reg                0x06 
#define Y_MSB_Reg                0x07 
#define Y_LSB_Reg                0x08 
#define Status_Reg               0x09 
#define ID_Reg_A                 0x0A              
#define ID_Reg_B                 0x0B 
#define ID_Reg_C                 0x0C                                               
                                    

unsigned long make_word(unsigned char HB, unsigned char LB); 
void HMC5883L_init();  
unsigned char HMC5883L_read(unsigned char reg); 
void HMC5883L_write(unsigned char reg_address, unsigned char value); 
void HMC5883L_read_data(); 
float HMC5883L_heading(); 
void Magneto_Init(void);

int Magneto_GetHeading(void);



#ifdef	__cplusplus
}
#endif

#endif	/* MAGNETOMETER_H */

