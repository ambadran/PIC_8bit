/*
 * File:   main.c
 * Author: ambadran717
 *
 * Created on February 27, 2022, 10:08 PM
 */


#include <xc.h>
#include "config.h"
#include "GPIO.h"
#include "ADC.h"
#include "UART.h"
#include "SPI.h"
#include "NRF24.h"

void main(void) {
    
    //GPIO
    setGPIO();
    
    //ADC module
    deinitADC();
    
    //UART module
    initUART(115200);
    
    //SPI module
    initSPI(true, 2); // setting SPI as master
    
    //Main Routine
    while(1) {
        if(button) {
            
            rawSendSPI(W_REGISTER | EN_AA);
            rawSendSPI(0b00111100);
            
            __delay_ms(300);
            
        }
    }
    
    return;
}
