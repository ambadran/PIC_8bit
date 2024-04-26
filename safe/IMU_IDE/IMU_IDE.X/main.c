/*
 * File:   main.c
 * Author: ambadran717
 *
 * Created on January 7, 2022, 4:42 PM
 */


#include <xc.h>
#include <stdint.h>
#include "config.h"
#include "UART.h"
#include "I2C.h"
#include "L3GD20.h"

#define button PORTBbits.RB3
#define debug_pin PORTCbits.RC0

void main(void) {
    
    // TRIS register
    TRISC0 = 0;
    debug_pin = 0;
    TRISB3 = 1; // Button
    
    // UART module
    init_UART(115200); // setting UART baud rate to 115200 bps

    // MSSP module
    init_I2C_Master(100000); // communication speed set to 100kHz
    
    // L3GD20 external module setup
    init_L3GD20();
    
    //Main Routine
    while(1) {
        
        //WHO_AM_I | read only | register: 0x0F = 0b0001111 | default output: 0b11010100 = 212
        
        if(button) {
            // initiate read sequence
            print(7);
            print(77);
            print(177);
            
            L3GD20_Read(REFERENCE);
            
//            print(L3GD20_Read(OUT_X_L));
            print(L3GD20_Read(OUT_X_H));
//            print(L3GD20_Read(OUT_Y_L));
            print(L3GD20_Read(OUT_Y_H));
//            print(L3GD20_Read(OUT_Z_L));
            print(L3GD20_Read(OUT_Z_H));
            
            
            print(L3GD20_Read(OUT_TEMP));
            
//            __delay_ms(100);
        }
        
        // Processing received data
        if(received) {
            print(uartReceived);
            received = false;
        }
    }
    
    return;
}

void __interrupt() ISR(void) {
    //UART interrupt service routine handling
    UART_ISR();
}
