/*
 * File:   main.c
 * Author: ambadran717
 *
 * Created on February 27, 2022, 9:41 PM
 */



#include <xc.h>
#include <pic18f45k22.h>
#include "config.h"
#include "oscillator.h"
#include "GPIO.h"
#include "UART.h"

void main(void) {
    
    // oscillator config
    set_internal_oscillator_with_PLL();
    
    //TRIS and ANS
    setGPIO();
    
    //UART1 module
    initUART1(115200);
    
    //Main Routine
    while(1) {
        if (switch) {
            led = 1;
            __delay_ms(10);
            led = 0;
            __delay_ms(10);
            print(3);
        }
    }
    
    return;
}
