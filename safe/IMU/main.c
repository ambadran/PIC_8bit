/*
 * File:   main.c
 * Author: ambadran717
 *
 * Created on January 7, 2022, 4:42 PM
 */


#include <xc.h>
#include "config.h"
#include <stdint.h>
#include "I2C.h"

#define button RB3

uint8_t received = 0;
unsigned char data;

void print(int value) {
    while(!TRMT) {
        // wait until TRMT bit is 0
    }
    TXREG = value;
}

void main(void) {
    
    // TRIS register
    TRISC0 = 0;
    RC0 = 0;
    TRISC6 = 1; // TX pin
    TRISC7 = 1; // RX pin
    TRISB3 = 1; // Button
    
    // comparator module
    CMCONbits.CM = 0b111; // All comparator inputs connected to ground
    
    //interrupts
    GIE = 1;
    PEIE = 1;
    RCIE = 1; // UART receive interrupt enable
    TMR0IE = 1; // TMR0 interrupt enable
    
    // UART module
    TXEN = 1;
    CREN = 1;
    SYNC = 0;
    SPEN = 1;
    BRG16 = 0;
    BRGH = 0;
    SPBRG = 77; // baud rate = 9600

    // MSSP module
    init_I2C_Master(100000);
    
    //Main Routine
    while(1) {
        
        //WHO_AM_I | read only | register: 0x0F = 0b000 1111 | default output: 11010100 = 212
        
        if(button) {
            
            print(0); // so i know the button is triggered
            __delay_ms(50);
            
            //master reading one byte sequence
            start_condition(); // ST
            rawSend(0b11010110); // SAD+W Assuming SDO=1
            rawSend(0b0001111); // SUB (WHO_AM_I) NOTE that it is missing a digit and that's okay
            restart_condition(); // SR
            rawSend(0b11010111); // SAD+R Assuming SDO=1
            data = rawRead_oneByte(); // DATA read
            stop_condition(); //SP

            __delay_ms(50);
            
            print(data);
            
            __delay_ms(200);
        }
        
        // Processing received data
        if(received) {
            RC0 = 1;
        } else {
            RC0 = 0;
        }
    }
    
    return;
}

void __interrupt() ISR(void) {
    if(RCIF) {
        received = RCREG;
        RCIF = 0;
    }
}
