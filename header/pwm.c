/*
 * File:   pwm.c
 * Author: audof
 *
 * Created on 5 juin 2019, 10:50
 */


#include "pwm.h"


void PWMinit()
{
    PR2 = 255;                                  // Fréquence 2900Hz
    CCP1CON=0b00001100;                         // PWM mode, précision 8 bits
    CCP2CON=0b00001100;                         // PWM mode, précision 8 bits
    TRISCbits.RC2=0;                            //RC2 in output
    TRISCbits.RC1=0;                            //RC1 in output
    LATCbits.LATC1 = 0;                         // Use LAT to write or use POR to read only
    LATCbits.LATC2 = 0;
    TMR2IF=0;                                   // Flag initialize at 0
    T2CON=0b00000011;                           // Prescaler 16
    T2CONbits.TMR2ON=1;                         // Enable Timer2
}

uint16_t Forward_Dir(uint8_t value)
{
    // To implement actual forward dir
    uint16_t Value_out = (value * PR2) / 100;
    CCPR1L = Value_out;
    CCPR2L = Value_out + 10;
    return Value_out;

}

uint16_t Reverse_Dir(uint8_t value)
{
    // To implement actual reverse dir
    uint16_t Value_out = (value * PR2) / 100;
    CCPR1L = Value_out;
    CCPR2L = Value_out + 10;
    return Value_out;
}

uint16_t hex2int(char *hex) {
    uint16_t tampon = 0;
    uint16_t Value_out = 0;

    for (int i = 0; i<2; i++)
    {
        tampon = hex[1 + i];
        if (tampon <= '9' && tampon >= '0')
        {
            Value_out = (Value_out << 4) + (tampon - '0');
        }
        else
        {
            if(tampon >= 'A' && tampon <= 'F')
            {
                Value_out = (Value_out << 4) + (tampon - 'A' + 10);
            }
            else
            {
                return 0;
            }
        }
    }
    return Value_out;
}
