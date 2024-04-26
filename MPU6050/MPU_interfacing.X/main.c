/*
 * File:   main.c
 * Author: ambadran717
 *
 * Created on October 14, 2022, 7:48 PM
 */


#include <xc.h>
#include "config.h"

void main(void) {
    
    // oscillator
    SCS1 = 1;
    SCS0 = 1;
    
    IRCF2 = 1;
    IRCF1 = 1;
    IRCF0 = 1;
    
    // GPIO
    TRISA = 0x00;
    
    TRISC = 0x00;
    TRISC0 = 0;
    
    // Main Routine
    while(1) {
        RC0 = 1;
        __delay_ms(200);
        RC0 = 0;
        __delay_ms(200);
    }
    
    return;
}
