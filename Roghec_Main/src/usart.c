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
