
/* PIC18F4550 USART Header File 
 * http://www.electronicwings.com
 */

// This is a guard condition so that contents of this file are not included
// more than once.  
#ifndef USART_HEADER_FILE_H
#define	USART_HEADER_FILE_H

#include <xc.h>
#include <stdbool.h>

void USART_Init(long);
void USART_TransmitChar(char);
void USART_SendString(const char *);
char USART_ReceiveChar();
bool EUSART1_is_tx_ready(void);
bool EUSART1_is_rx_ready(void);


#endif	/* USART_HEADER_FILE_H */

