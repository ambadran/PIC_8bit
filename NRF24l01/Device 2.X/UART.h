#include "config.h"
#include <stdbool.h>
#include <stdint.h>

unsigned char uartdata;
bool received = false;

void print(unsigned char value) {
    while(!TRMT);
    TXREG = value;
//    __delay_ms(50);
}

void initUART(long int baud_rate) {
    TXEN = 1;
    CREN = 1;
    SYNC = 0;
//    SPEN = 1;
    
    TX9 = 0;
    SENDB = 1;
    
    TX_TRIS = 1; // TX pin
    RX_TRIS = 1; // RX pin
    
    BRGH = 1;
    BRG16 = 1;
    
    uint16_t num1 = (uint16_t)(_XTAL_FREQ/baud_rate)/4 - 1;
    SPBRGH = ((uint16_t)num1 >> 8) & 0xFF;
    SPBRG = ((uint16_t)num1 >> 0) & 0xFF;
    //TODO: fix the stupid 
    //warning: implicit conversion loses integer precision: 'long' to 'unsigned char'
    // I tried using (unsigned char) and (uint8_t) 
    //      it affects the output value to SPBRG the baud rate become wrong
    // uint16_t gives the same warning as it is essentially (unsigned int)
    //(unsigned char)(uint16_t) doesn't work too 
    
    //interrupts
    GIE = 1;
    PEIE = 1;
    RCIE = 1; // UART receive interrupt enable
}

void UART_ISR() {
    if(RCIF) {
        uartdata = RCREG;
        received = true;
        RCIF = 0;
    }
}


