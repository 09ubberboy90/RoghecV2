/* PIC18F4550 USART Source File 
 * http://www.electronicwings.com
 */

#include "usart.h"
#include "interupts.h"
/*****************************USART Initialization*******************************/
void USART_Init()
{
    
    //PIE1bits.RC1IE = 1;

    TRISCbits.RC6 = 0;                       /*Make Tx pin as output*/
    TRISCbits.RC7 = 1;                       /*Make Rx pin as input*/
    
    LATCbits.LATC7 = 0;
    ANSELCbits.ANSC7 = 0;

    //temp=(48000000 - baud_rate*64)/(baud_rate*64); 
    
    // ABDOVF no_overflow; CKTXP async_noninverted_sync_fallingedge; BRG16 16bit_generator; WUE disabled; ABDEN disabled; DTRXP not_inverted; 
    BAUDCON1 = 0x08;

    // SPEN enabled; RX9 8-bit; CREN enabled; ADDEN disabled; SREN disabled; 
    RCSTA1 = 0x90;

    // TX9 8-bit; TX9D 0; SENDB sync_break_complete; TXEN enabled; SYNC asynchronous; BRGH hi_speed; CSRC slave_mode; 
    TXSTA1 = 0x24;

    // SPBRG1 225; 
    SPBRG1 = 0xE1;


}
/******************TRANSMIT FUNCTION*****************************************/ 
void USART_TransmitChar(char out)
{        
    while(!PIR1bits.TX1IF);            /*wait for transmit interrupt flag*/
    TXREG=out;                 /*wait for transmit interrupt flag to set which indicates TXREG is ready*/
}
/*******************RECEIVE FUNCTION*****************************************/
char USART_ReceiveChar()
{
    while(!PIR1bits.RC1IF);                 /*wait for receive interrupt flag*/
    return(RCREG1);                  /*receive data is stored in RCREG register and return to main program */
}

void USART_SendString(const char *out)
{
    while(*out!='\0')
    {            
         USART_TransmitChar(*out);
         out++;
    }
}
bool EUSART1_is_tx_ready(void)
{
    return (bool)(PIR1bits.TX1IF && TXSTA1bits.TXEN);
}

bool EUSART1_is_rx_ready(void)
{
    return PIR1bits.RC1IF;
}
