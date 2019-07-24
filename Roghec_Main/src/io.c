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

#include <io.h>
#include <stdbool.h>
#include <xc.h>
#include <pic18f45k50.h>


//MOTORA and MOTORB are useless since they are enable by pwm
#define SERVO_1_TRIS TRISDbits.TRISD0
#define SERVO_2_TRIS TRISDbits.TRISD1
#define SERVO_3_TRIS TRISDbits.TRISD2
#define SERVO_4_TRIS TRISDbits.TRISD3
#define SERVO_5_TRIS TRISDbits.TRISD4
#define SERVO_6_TRIS TRISDbits.TRISD5
#define SERVO_7_TRIS TRISDbits.TRISD6
#define SERVO_8_TRIS TRISDbits.TRISD7
#define SERVO_9_TRIS TRISBbits.TRISB2
#define SERVO_10_TRIS TRISBbits.TRISB3
#define SERVO_11_TRIS TRISBbits.TRISB4

#define SERVO_1_LAT LATDbits.LATD0
#define SERVO_2_LAT LATDbits.LATD1
#define SERVO_3_LAT LATDbits.LATD2
#define SERVO_4_LAT LATDbits.LATD3
#define SERVO_5_LAT LATDbits.LATD4
#define SERVO_6_LAT LATDbits.LATD5
#define SERVO_7_LAT LATDbits.LATD6
#define SERVO_8_LAT LATDbits.LATD7
#define SERVO_9_LAT LATBbits.LATB2
#define SERVO_10_LAT LATBbits.LATB3
#define SERVO_11_LAT LATBbits.LATB4

#define SERVO_1_ANSEL ANSELDbits.ANSD0
#define SERVO_2_ANSEL ANSELDbits.ANSD1
#define SERVO_3_ANSEL ANSELDbits.ANSD2
#define SERVO_4_ANSEL ANSELDbits.ANSD3
#define SERVO_6_ANSEL ANSELDbits.ANSD5
#define SERVO_7_ANSEL ANSELDbits.ANSD6
#define SERVO_8_ANSEL ANSELDbits.ANSD7
#define SERVO_9_ANSEL ANSELBbits.ANSB2
#define SERVO_10_ANSEL ANSELBbits.ANSB3
#define SERVO_11_ANSEL ANSELBbits.ANSB4

#define MotorAF_LAT LATAbits.LATA5
#define MotorAR_LAT LATAbits.LATA3
#define MotorBF_LAT LATAbits.LATA4
#define MotorBR_LAT LATAbits.LATA2

#define MotorAF_TRIS TRISAbits.TRISA5
#define MotorAR_TRIS TRISAbits.TRISA3
#define MotorBF_TRIS TRISAbits.TRISA4
#define MotorBR_TRIS TRISAbits.TRISA2

#define MotorAF_ANSEL ANSELAbits.ANSA5
#define MotorAR_ANSEL ANSELAbits.ANSA3
#define MotorBR_ANSEL ANSELAbits.ANSA2

#define ON  1
#define OFF 0

#define PIN_INPUT           1
#define PIN_OUTPUT          0

#define PIN_DIGITAL         0
#define PIN_ANALOG          1


void Pin_Init()
{
    for (int pin = PIN_FIRST; pin < PIN_LAST; ++pin)
    {
        Pin_Enable(pin);
    }

}


/*********************************************************************
* Function: void LED_On(LED led);
*
* Overview: Turns requested LED on
*
* PreCondition: LED configured via LED_Configure()
*
* Input: LED led - enumeration of the LEDs available in this
*        demo.  They should be meaningful names and not the names of
*        the LEDs on the silkscreen on the board (as the demo code may
*        be ported to other boards).
*         i.e. - LED_On(LED_CONNECTION_DETECTED);
*
* Output: none
*
********************************************************************/
void Pin_On(PIN led)
{
    switch(led)
    {
        case SERVO_1:
            SERVO_1_LAT = ON;
            break;
        case SERVO_2:
            SERVO_2_LAT = ON;
            break;
        case SERVO_3:
            SERVO_3_LAT = ON;
            break;
        case SERVO_4:
            SERVO_4_LAT = ON;
            break;
        case SERVO_5:
            SERVO_5_LAT = ON;
            break;
        case SERVO_6:
            SERVO_6_LAT = ON;
            break;
        case SERVO_7:
            SERVO_7_LAT = ON;
            break;
        case SERVO_8:
            SERVO_8_LAT = ON;
            break;
        case SERVO_9:
            SERVO_9_LAT = ON;
            break;
        case SERVO_10:
            SERVO_10_LAT = ON;
            break;
        case SERVO_11:
            SERVO_11_LAT = ON;
            break;
        case MOTOR_A_F:
            MotorAF_LAT = ON;
            break;
        case MOTOR_A_R:
            MotorAR_LAT = ON;
            break;
        case MOTOR_B_F:
            MotorBF_LAT = ON;
            break;
        case MOTOR_B_R:
            MotorBR_LAT = ON;
            break;

        default:
            break;
    }
}

/*********************************************************************
* Function: void LED_Off(LED led);
*
* Overview: Turns requested LED off
*
* PreCondition: LED configured via LEDConfigure()
*
* Input: LED led - enumeration of the LEDs available in this
*        demo.  They should be meaningful names and not the names of
*        the LEDs on the silkscreen on the board (as the demo code may
*        be ported to other boards).
*         i.e. - LED_Off(LED_CONNECTION_DETECTED);
*
* Output: none
*
********************************************************************/
void Pin_Off(PIN led)
{
    switch(led)
    {			
        case SERVO_1:
            SERVO_1_LAT = OFF;
            break;
        case SERVO_2:
            SERVO_2_LAT = OFF;
            break;
        case SERVO_3:
            SERVO_3_LAT = OFF;
            break;
        case SERVO_4:
            SERVO_4_LAT = OFF;
            break;
        case SERVO_5:
            SERVO_5_LAT = OFF;
            break;
        case SERVO_6:
            SERVO_6_LAT = OFF;
            break;
        case SERVO_7:
            SERVO_7_LAT = OFF;
            break;
        case SERVO_8:
            SERVO_8_LAT = OFF;
            break;
        case SERVO_9:
            SERVO_9_LAT = OFF;
            break;
        case SERVO_10:
            SERVO_10_LAT = OFF;
            break;
        case SERVO_11:
            SERVO_11_LAT = OFF;
            break;

        case MOTOR_A_F:
            MotorAF_LAT = OFF;
            break;
            
        case MOTOR_A_R:
            MotorAR_LAT = OFF;
            break;
            
        case MOTOR_B_F:
            MotorBF_LAT = OFF;
            break;
            
        case MOTOR_B_R:
            MotorBR_LAT = OFF;
            break;
            
        default:
            break;
    }
}

/*********************************************************************
* Function: void LED_Toggle(LED led);
*
* Overview: Toggles the state of the requested LED
*
* PreCondition: LED configured via LEDConfigure()
*
* Input: LED led - enumeration of the LEDs available in this
*        demo.  They should be meaningful names and not the names of
*        the LEDs on the silkscreen on the board (as the demo code may
*        be ported to other boards).
*         i.e. - LED_Toggle(LED_CONNECTION_DETECTED);
*
* Output: none
*
********************************************************************/
void Pin_Toggle(PIN led)
{
    switch(led)
    {
        case SERVO_1:
            SERVO_1_LAT ^= 1;
            break;
        case SERVO_2:
            SERVO_2_LAT ^= 1;
            break;
        case SERVO_3:
            SERVO_3_LAT ^= 1;
            break;
        case SERVO_4:
            SERVO_4_LAT ^= 1;
            break;
        case SERVO_5:
            SERVO_5_LAT ^= 1;
            break;
        case SERVO_6:
            SERVO_6_LAT ^= 1;
            break;
		
        case SERVO_7:
            SERVO_7_LAT ^= 1;
            break;
            
        case SERVO_8:
            SERVO_8_LAT ^= 1;
            break;
            
        case SERVO_9:
            SERVO_9_LAT ^= 1;
            break;
            
        case SERVO_10:
            SERVO_10_LAT ^= 1;
            break;
            
        case SERVO_11:
            SERVO_11_LAT ^= 1;
            break;
            
        case MOTOR_A_F:
            MotorAF_LAT ^= 1;
            break;
            
        case MOTOR_A_R:
            MotorAR_LAT ^= 1;
            break;
            
        case MOTOR_B_F:
            MotorBF_LAT ^= 1;
            break;
            
        case MOTOR_B_R:
            MotorBR_LAT ^= 1;
            break;
        default:
            break;
    }
}

/*********************************************************************
* Function: void LED_Enable(LED led);
*
* Overview: Configures the LED for use by the other LED API
*
* PreCondition: none
*
* Input: LED led - enumeration of the LEDs available in this
*        demo.  They should be meaningful names and not the names of
*        the LEDs on the silkscreen on the board (as the demo code may
*        be ported to other boards).
*
* Output: none
*
********************************************************************/
void Pin_Enable(PIN led)
{
    switch(led)
    {
        case MOTOR_A_F:
            MotorAF_TRIS = PIN_OUTPUT;
            MotorAF_ANSEL= PIN_DIGITAL;
            break;
            
        case MOTOR_A_R:
            MotorAR_TRIS = PIN_OUTPUT;
            MotorAR_ANSEL= PIN_DIGITAL;
            
        case MOTOR_B_F:
            MotorBF_TRIS = PIN_OUTPUT;
            break;
            
        case MOTOR_B_R:
            MotorBR_TRIS = PIN_OUTPUT;
            MotorBR_ANSEL= PIN_DIGITAL;
            break;
        case SERVO_1:
            SERVO_1_TRIS = PIN_OUTPUT;
            SERVO_1_ANSEL = PIN_DIGITAL;
            break;
        case SERVO_2:
            SERVO_2_TRIS = PIN_OUTPUT;
            SERVO_2_ANSEL = PIN_DIGITAL;
            break;
        case SERVO_3:
            SERVO_3_TRIS = PIN_OUTPUT;
            SERVO_3_ANSEL = PIN_DIGITAL;
            break;
        case SERVO_4:
            SERVO_4_TRIS = PIN_OUTPUT;
            SERVO_4_ANSEL = PIN_DIGITAL;
            break;
        case SERVO_5:
            SERVO_5_TRIS = PIN_OUTPUT;
            break;
        case SERVO_6:
            SERVO_6_TRIS = PIN_OUTPUT;
            SERVO_6_ANSEL = PIN_DIGITAL;
            break;
        case SERVO_7:
            SERVO_7_TRIS = PIN_OUTPUT;
            SERVO_7_ANSEL = PIN_DIGITAL;
            break;
        case SERVO_8:
            SERVO_8_TRIS = PIN_OUTPUT;
            SERVO_8_ANSEL = PIN_DIGITAL;
            break;
        case SERVO_9:
            SERVO_9_TRIS = PIN_OUTPUT;
            SERVO_9_ANSEL = PIN_DIGITAL;
            break;
        case SERVO_10:
            SERVO_10_TRIS = PIN_OUTPUT;
            SERVO_10_ANSEL = PIN_DIGITAL;
            break;
        case SERVO_11:
            SERVO_11_TRIS = PIN_OUTPUT;
            SERVO_11_ANSEL = PIN_DIGITAL;
            break;
        default:
            break;
    }
}
