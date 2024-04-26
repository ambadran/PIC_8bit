/* 
 * File:   
 * Author: 
 * Comments:
 * Revision history: 
 */

// This is a guard condition so that contents of this file are not included
// more than once.  
#ifndef XC_HEADER_TEMPLATE_H
#define	XC_HEADER_TEMPLATE_H

#include <xc.h> // include processor files - each processor file is guarded.  
////////////////////////////// UART module ////////////////////////////////////
#define TX_TRIS TRISC6
#define RX_TRIS TRISC7

#define TX PORTCbits.RC6
#define RX PORTCbits.RC7
//////////////////////////////////////////////////////////////////////////////



////////////////////////////// SPI module ////////////////////////////////////
#define SDO_TRIS TRISC7
#define SDI_TRIS TRISB0
#define SCK_TRIS TRISB1

#define SDO PORTCbits.RC7
#define SDI PORTBbits.RB0
#define SCK PORTBbits.RB1

#define SS_TRIS TRISA3
#define SS PORTAbits.RA3
//////////////////////////////////////////////////////////////////////////////



//////////////////////////////// NRF24l01 pins ///////////////////////////////
#define CE_TRIS TRISA2 // chip enable pin for nrf
#define CE PORTAbits.RA2
//////////////////////////////////////////////////////////////////////////////



///////////////////////// miscillaneous pins /////////////////////////////////
#define led PORTAbits.RA5
#define button PORTAbits.RA4
//////////////////////////////////////////////////////////////////////////////


void setGPIO() {
    //* for miscillaneous GPIO pins *//
    
    //TRIS register
    TRISA5 = 0; // led
    TRISA4 = 1; // switch
}

#endif	/* XC_HEADER_TEMPLATE_H */

