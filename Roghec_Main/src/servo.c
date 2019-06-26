#include <xc.h>
#include "servo.h"
#include "interupts.h"
#include <stdio.h>
#include <string.h>
#include "io.h"
#include "system.h"
Servo_Pin_Control main_mvt;
uint8_t servo_nb = 0;

void Servo_Init()
{
    main_mvt.nb_servo = 6;
    PIN tmp_pin[6] = {SERVO_1,SERVO_2,SERVO_3,SERVO_4,SERVO_5,SERVO_6};
    memcpy(main_mvt.pin, tmp_pin,sizeof(tmp_pin));
    uint8_t tmp_time[6] =  {15,15,15,15,15,15};
    memcpy(main_mvt.time, tmp_time,sizeof(tmp_time));

}
void Servo_Value()
{
    uint8_t input[3];
    uint8_t result;
    char mess[50];
    bool error_flag = false;
    #ifdef USB_MODE
        uint8_t numBytesRead = 0;
        uint8_t readBuffer[50];

        for (int i = 0; i < 3; i++)
        {
            do {
                numBytesRead = getsUSBUSART(readBuffer, sizeof(readBuffer));
            }
            while(numBytesRead==0);
            input[i] = readBuffer[0];

        }
    #endif
    #ifdef BLUETOOTH_MODE
        for (int i = 0; i < 3; i++)
        {
            input[i] = USART_ReceiveChar();
        }
    #endif
    result = ((input[1]-'0')*10+(input[2]-'0'));
    if(result< 9 || result > 21)
    {
        error_flag = true;
    }
    if(input[0] >= '0' && input[0] <= '9' && !error_flag)
    {
        T1CONbits.TMR1ON = 1;
        input[0] = (int)input[0]-'0';
        servo_nb = input[0]+8;

        if (input[0] == 1 || input[0] == 2)
        {
            main_mvt.time[1] = result;
            main_mvt.time[2] = result;
            sprintf(mess,"SERVO_2 and SERVO_3 set with motion %u\r\n",result);

        }
        else
        {
            main_mvt.time[input[0]] = result;
            sprintf(mess,"%s set with motion %u,%u,%u\r\n",pin_name[servo_nb],result,servo_nb,input[0]);

        }
    }
    else{
        error_flag = true;
    }
    if (error_flag)
    {
        sprintf(mess,"Error Rotor\r\n");
    }
    Send_Message(mess);

}

Servo_Pin_Control * Get_Gesture(void)
{
    return &main_mvt;
}
void Servo_Control(){
    uint8_t input[10];
    char mess[50];
#ifdef USB_MODE
    /* If the USB device isn't configured yet, we can't really do anything
     * else since we don't have a host to talk to.  So jump back to the
     * top of the while loop. */
    if( USBGetDeviceState() < CONFIGURED_STATE )
    {
        return;
    }
    /* If we are currently suspended, then we need to see if we need to
     * issue a remote wakeup.  In either case, we shouldn't process any
     * keyboard commands since we aren't currently communicating to the host
     * thus just continue back to the start of the while loop. */
    if( USBIsDeviceSuspended()== true )
    {
        return;
    }
        
    if( USBUSARTIsTxTrfReady() == true)
    {
        uint8_t numBytesRead = 0;
        //numBytesRead = getsUSBUSART(readBuffer, sizeof(readBuffer));
        numBytesRead = getsUSBUSART(input, sizeof(input));
        
        /* For every byte that was read... */
        if (numBytesRead != 0)
        {
#endif
#ifdef BLUETOOTH_MODE
        input[0] = USART_ReceiveChar();
#endif
    switch(input[0])
    {
        case 0x47://G
        case 0x67://G
            for (int i = 0; i < 6; i++)
            {
                sprintf(mess,"%s is set at %u ms\r\n",pin_name[i+8],main_mvt.time[i]);
                Send_Message(mess);
            }
            break;
        case 0x45://E
        case 0x65://e
            T1CONbits.TMR1ON = 1;
            Send_Message("Servo Enabled\r\n");
            break;
        case 0x44://D
        case 0x64://d
            T1CONbits.TMR1ON = 0;
            Send_Message("Servo Disabled\r\n");
            break;

        default:
            Send_Message("Error Rotor\r\n");
            break;
    }
#ifdef USB_MODE
            }
        }
#endif

}
