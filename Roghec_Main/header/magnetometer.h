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

void Magneto_init(void);										/* Magneto initialize function */

int Magneto_GetHeading(int offset);

int Magneto_GetOffset();



#ifdef	__cplusplus
}
#endif

#endif	/* MAGNETOMETER_H */

