/********************************************************************
 Software License Agreement:

 The software supplied herewith by Microchip Technology Incorporated
 (the "Company") for its PIC(R) Microcontroller is intended and
 supplied to you, the Company's customer, for use solely and
 exclusively on Microchip PIC Microcontroller products. The
 software is owned by the Company and/or its supplier, and is
 protected under applicable copyright laws. All rights are reserved.
 Any use in violation of the foregoing restrictions may subject the
 user to criminal sanctions under applicable laws, as well as to
 civil liability for the breach of the terms and conditions of this
 license.

 THIS SOFTWARE IS PROVIDED IN AN "AS IS" CONDITION. NO WARRANTIES,
 WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED
 TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE COMPANY SHALL NOT,
 IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL OR
 CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
 *******************************************************************/

#include <leds.h>
#include <stdbool.h>
#include <xc.h>


//MOTORA and MOTORB are useless since they are enable by pwm
#define LED_D1_LAT LATDbits.LATD0
#define LED_D2_LAT LATDbits.LATD1
#define MotorA_LAT LATDbits.LATD2
#define MotorB_LAT LATDbits.LATD3

#define LED_D1_TRIS TRISDbits.TRISD0
#define LED_D2_TRIS TRISDbits.TRISD1
#define MotorA_TRIS TRISDbits.TRISD2
#define MotorB_TRIS TRISDbits.TRISD3

#define LED_D1_ANSEL ANSELDbits.ANSD0
#define LED_D2_ANSEL ANSELDbits.ANSD1
#define MotorA_ANSEL ANSELDbits.ANSD2
#define MotorB_ANSEL ANSELDbits.ANSD3



#define MotorAF_LAT LATDbits.LATD4
#define MotorAR_LAT LATDbits.LATD5
#define MotorBF_LAT LATDbits.LATD6
#define MotorBR_LAT LATDbits.LATD7

#define MotorAF_TRIS TRISDbits.TRISD4
#define MotorAR_TRIS TRISDbits.TRISD5
#define MotorBF_TRIS TRISDbits.TRISD6
#define MotorBR_TRIS TRISDbits.TRISD7

#define MotorAF_ANSEL ANSELDbits.ANSD4
#define MotorAR_ANSEL ANSELDbits.ANSD5
#define MotorBF_ANSEL ANSELDbits.ANSD6
#define MotorBR_ANSEL ANSELDbits.ANSD7

#define ON  1
#define OFF 0

#define PIN_INPUT           1
#define PIN_OUTPUT          0

#define PIN_DIGITAL         0
#define PIN_ANALOG          1

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
void Motor_On(MOTOR led)
{
    switch(led)
    {
        case LED_D1:
            LED_D1_LAT = ON;
            break;

        case LED_D2:
            LED_D2_LAT = ON;
            break;
			
        case MOTOR_A:
            MotorA_LAT = ON;
            break;
			
        case MOTOR_B:
            MotorB_LAT = ON;
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

        case LED_NONE:
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
void Motor_Off(MOTOR led)
{
    switch(led)
    {
        case LED_D1:
            LED_D1_LAT = OFF;
            break;

        case LED_D2:
            LED_D2_LAT = OFF;
            break;
			
        case MOTOR_A:
            MotorA_LAT = OFF;
            break;
			
        case MOTOR_B:
            MotorB_LAT = OFF;
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
            
        case LED_NONE:
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
void Motor_Toggle(MOTOR led)
{
    switch(led)
    {
        case LED_D1:
            LED_D1_LAT ^= 1;
            break;

        case LED_D2:
            LED_D2_LAT ^= 1;
            break;
			
        case MOTOR_A:
            MotorA_LAT ^= 1;
            break;
			
        case MOTOR_B:
            MotorB_LAT ^= 1;
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
        case LED_NONE:
            break;
    }
}

/*********************************************************************
* Function: bool LED_Get(LED led);
*
* Overview: Returns the current state of the requested LED
*
* PreCondition: LED configured via LEDConfigure()
*
* Input: LED led - enumeration of the LEDs available in this
*        demo.  They should be meaningful names and not the names of
*        the LEDs on the silkscreen on the board (as the demo code may
*        be ported to other boards).
*         i.e. - LED_Get(LED_CONNECTION_DETECTED);
*
* Output: true if on, false if off
*
********************************************************************/
bool Motor_Get(MOTOR led)
{
    switch(led)
    {
        case LED_D1:
            return ( (LED_D1_LAT == ON) ? true : false );

        case LED_D2:
            return ( (LED_D2_LAT == ON) ? true : false );
			
        case MOTOR_A:
            return ( (MotorA_LAT == ON) ? true : false );
			
        case MOTOR_B:
            return ( (MotorB_LAT == ON) ? true : false );

        case MOTOR_A_F:
            return ( (MotorAF_LAT == ON) ? true : false );
            
        case MOTOR_A_R:
            return ( (MotorAR_LAT == ON) ? true : false );
            
        case MOTOR_B_F:
            return ( (MotorBF_LAT == ON) ? true : false );  
            
        case MOTOR_B_R:
            return ( (MotorBR_LAT == ON) ? true : false );
            
        case LED_NONE:
            return false;
    }
    
    return false;
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
void Motor_Enable(MOTOR led)
{
    switch(led)
    {
        case LED_D1:
            LED_D1_TRIS = PIN_OUTPUT;
            LED_D1_ANSEL = PIN_DIGITAL;
            break;

        case LED_D2:
            LED_D2_TRIS = PIN_OUTPUT;
            LED_D1_ANSEL = PIN_DIGITAL;
            break;
			
        case MOTOR_A:
            MotorA_TRIS = PIN_OUTPUT;
            MotorA_ANSEL= PIN_DIGITAL;
            break;
			
        case MOTOR_B:
            MotorB_TRIS = PIN_OUTPUT;
            MotorB_ANSEL= PIN_DIGITAL;
            break;
        
        case MOTOR_A_F:
            MotorAF_TRIS = PIN_OUTPUT;
            MotorAF_ANSEL= PIN_DIGITAL;
            break;
            
        case MOTOR_A_R:
            MotorAR_TRIS = PIN_OUTPUT;
            MotorAR_ANSEL= PIN_DIGITAL;
            
        case MOTOR_B_F:
            MotorBF_TRIS = PIN_OUTPUT;
            MotorBF_ANSEL= PIN_DIGITAL;
            break;
            
        case MOTOR_B_R:
            MotorBR_TRIS = PIN_OUTPUT;
            MotorBR_ANSEL= PIN_DIGITAL;
            break;
            
        case LED_NONE:
            break;
    }
}
