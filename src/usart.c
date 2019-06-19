/* PIC18F4550 USART Source File 
 * http://www.electronicwings.com
 */

#include "usart.h"
#include "interupts.h"
/*****************************USART Initialization*******************************/
void USART_Init(long baud_rate)
{
    float temp;
    TRISC6=0;                       /*Make Tx pin as output*/
    TRISC7=1;                       /*Make Rx pin as input*/
    temp=(((float)(F_CPU)/(float)baud_rate)-1);     
    SPBRG=(int)temp;                /*baud rate=9600, SPBRG = (F_CPU /(64*9600))-1*/
    TXSTA=0x20;                     /*Transmit Enable(TX) enable*/ 
    PIE1bits.TXIE = 0; // Enable USART Transmitter interrupt
    PIE1bits.RCIE = 1; // Enable USART Receive interrupt

    RCSTA=0x90;                     /*Receive Enable(RX) enable and serial port enable */
    TXIF=RCIF=0;

}
/******************TRANSMIT FUNCTION*****************************************/ 
void USART_TransmitChar(char out)
{        
    while(!TXIF);            /*wait for transmit interrupt flag*/
    TXREG=out;                 /*wait for transmit interrupt flag to set which indicates TXREG is ready*/
}
/*******************RECEIVE FUNCTION*****************************************/
char USART_ReceiveChar()
{
    while(!RCIF);                 /*wait for receive interrupt flag*/
    return(RCREG);                  /*receive data is stored in RCREG register and return to main program */
}

void USART_SendString(const char *out)
{
   while(*out!='\0')
   {            
        USART_TransmitChar(*out);
        out++;
   }
}
/*********************************Delay Function********************************/
void MSdelay(unsigned int val)
{
     unsigned int i,j;
        for(i=0;i<=val;i++)
            for(j=0;j<81;j++);      /*This count Provide delay of 1 ms for 8MHz Frequency */
}
