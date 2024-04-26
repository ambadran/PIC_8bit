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

#include "config.h"

void init_I2C_Master(long int baudRate) {
    TRISB0 = 1; // SDA pin input
    TRISB1 = 1; // SCL pin input
    
    SSPCON1bits.SSPM = 0b1000; // Master mode
    SSPCON1bits.SSPEN = 1; // MSSP module ON
    SSPCON2 = 0x00; // defaulting to 0
    SSPSTAT = 0x00; // defaulting to 0
    SSPADD = (unsigned char)((_XTAL_FREQ/4)/baudRate) - 1;
}

void wait() {
  while ((SSPSTAT & 0x04) || (SSPCON2 & 0x1F));
  //0x04 = 0b100, 0x1F = 0b11111
  
  // SSPSTATbits.BF == 0 // bit0: in transmit mode, SSPBUF is empty
  // SSPSTATbits.UA == 0 // bit1: Address does need to be updated
  // SSPSTATbits.R ==1 // bit2: in master mode, transmit in progress
  
  // SSPCON2bits.SEN == 1 // bit0: start condition
  // SSPCON2bits.RSEN == 1 // bit1: repeat start condition
  // SSPCON2bits.PEN == 1 // bit2: stop condition
  // SSPCON2bits.RCEN == 1 // bit3: receive enable bit
  // SSPCON2bits.ACKEN == 1 // bit4: Acknowledge sequence enable bit
  
  // once all these conditions are NOT met, wait is over and we can proceed
}

void start_condition() {
  // Start Condition Sequence
  wait();
  SEN = 1;
}

void stop_condition() {
  // Stop Condition Sequence
  wait();
  PEN = 1;
}

void restart_condition() {
  // Restart Condition Sequence
  wait();
  RSEN = 1;
}

void sendACK(void) {
  // Send ACK - For Master Receiver Mode
  wait();
  ACKDT = 0; // 0 -> ACK, 1 -> NACK
  ACKEN = 1; // Send ACK Signal!
}

void sendNACK(void) {
  // Send NACK - For Master Receiver Mode
  wait();
  ACKDT = 1; // 1 -> NACK, 0 -> ACK
  ACKEN = 1; // Send NACK Signal!
}

unsigned char rawSend(unsigned char data) {
  // Send Byte, Return The ACK/NACK
  wait();
  SSPBUF = data;
  wait();
  return ACKSTAT;
}

void sendI2C(unsigned char address, unsigned char data) {
    start_condition();
    rawSend(address); // address
    rawSend(data); // data
    stop_condition();
}

unsigned char rawRead(void) {
    unsigned char Data;
    wait();
    RCEN = 1;
    wait();
    Data = SSPBUF;
    sendNACK(); // to tell the slave master don't want to receive any more
    return Data;
}

unsigned char readI2C(unsigned char address) {
    start_condition();
    rawSend(address + 1);
    unsigned char result = rawRead();
    stop_condition();
    return result;
}

void init_I2C_Slave(unsigned char address) {
    TRISB0 = 1; // SDA pin input
    TRISB1 = 1; // SCL pin input
    
    SSPADD = address; // setting device address
    SSPSTATbits.SMP = 1; // disabling slew rate for standard speed mode (100kHz)
    SSPCON1bits.SSPM = 0b0110; // setting to I2C slave mode, 7bit address
    SSPCON1bits.CKP = 1; // in slave mode, disabling clock stretching, I2C line left high
    SSPCON1bits.SSPEN = 1; // enabling MSSP module
    
    GIE = 1; // enabling interrupts
    PEIE = 1;
    SSPIE = 1;
    SSPIF = 0;
}

#endif	/* XC_HEADER_TEMPLATE_H */

