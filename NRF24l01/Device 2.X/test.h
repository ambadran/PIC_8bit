/*
    Wireless communication using a PIC18F4550 (master) and nRF24L01 (slave) - Transmitter
 */

/***************************************************** 
        Includes
**************************************************** */

// Include files
#include <p18cxxx.h>                        // Finds correct header for any PIC18
#include <delays.h>                            // Enables you to add varying amount of NOPs (Delays)
#include <stdlib.h>
#include <spi.h>                            // Just in case we want to cheat with SPI

// Define names for LED pins
#define LED1         PORTAbits.RA0            // blinky light (code is running)

// Define names for SPI connection pins
#define CE             PORTAbits.RA2            // Chip Enable (CE)            -- Pin that activates RX or TX mode
#define IRQ         PORTBbits.RB2            // Interrupt Request (IRQ)    -- Pin that signals transmission
#define SDO         TRISCbits.TRISC7        // Serial Data Out (SDO)    -- Pin that data goes out from
#define SDI         TRISBbits.TRISB0        // Serial Data In (SDI)        -- Pin that data comes in to
#define SCK         TRISBbits.TRISB1        // Serial Clock (SCK)        -- Pin that sends clock signal to sync all  SPI devices

// Define names for "Slave Select" pins
#define SS          PORTAbits.RA4            // Slave Select (SS)        -- Pin that selects "slave" module to communicate with

#define select         0                        // Device is "active low," define "select" as 0
#define deselect    1

// Define names for SPI configuration pins
#define SMP            SSPSTATbits.SMP            // Sample Bit (SMP)            -- Pin that sets where to sample data
#define CKP            SSPCON1bits.CKP            // Clock Polarity (CKP)        -- Pin that sets where SCK will idle
#define CKE            SSPSTATbits.CKE            // Clock Edge Select (CKE)    -- Pin that sets which transition transmission takes place
#define SSPEN        SSPCON1bits.SSPEN        // Serial Prt Enbl (SSPEN)    -- Pin that will enable serial port and configure SCK, SDO, SDI and SS as serial port pins

#define WCOL        SSPCON1bits.WCOL        // Write Collision (WCOL)    -- Detect bit
#define WCOL_LED    PORTCbits.RC1            // Write Collision (WCOL)    -- Pin for collision visual

// Define commands for Nordic via SPI
#define R_REGISTER        0x00
#define W_REGISTER        0x20
#define R_RX_PAYLOAD    0x61
#define W_TX_PAYLOAD    0xA0
#define FLUSH_TX        0xE1
#define FLUSH_RX        0xE2
#define REUSE_TX_PL        0xE3
#define NOP                0xFF

// Define Nordic registers
#define CONFIG            0x00
#define EN_AA            0x01
#define EN_RXADDR        0x02
#define SETUP_AW        0x03
#define SETUP_RETR        0x04
#define RF_CH            0x05
#define RF_SETUP        0x06
#define STATUS            0x07
#define OBSERVE_TX        0x08
#define CD                0x09
#define RX_ADDR_P0        0x0A
#define RX_ADDR_P1        0x0B
#define RX_ADDR_P2        0x0C
#define RX_ADDR_P3        0x0D
#define RX_ADDR_P4        0x0E
#define RX_ADDR_P5        0x0F
#define TX_ADDR            0x10
#define RX_PW_P0        0x11
#define RX_PW_P1        0x12
#define RX_PW_P2        0x13
#define RX_PW_P3        0x14
#define RX_PW_P4        0x15
#define RX_PW_P5        0x16
#define FIFO_STATUS        0x17

/***************************************************** 
        Function Prototypes & Variables
**************************************************** */ 

void initChip(void);
void init_spi_master(void);
void init_nordic(void);
void InterruptHandler_SPI(void);
void InterruptHandler_Nordic(void);
void delay(void);
void spi_write(int data);
void transmit_data(int data);

unsigned char spi_transmission_done;
unsigned char data_sent;
unsigned char data;
unsigned char dummy;

/*************************************************
  RESET VECTORS: REMOVE IF NOT USING BOOTLOADER!!!
**************************************************/

extern void _startup (void);        
#pragma code _RESET_INTERRUPT_VECTOR = 0x000800
void _reset (void)
{
    _asm goto _startup _endasm
}
#pragma code

/*************************************************
  Interrupt Service Routines
**************************************************/

#pragma code _HIGH_INTERRUPT_VECTOR = 0x000808
void _high_ISR (void)
{
    InterruptHandler_SPI;
    InterruptHandler_Nordic;
}
#pragma code

#pragma code _LOW_INTERRUPT_VECTOR = 0x000818
void _low_ISR (void)
{
    InterruptHandler_Nordic();
} 
#pragma code

void delay() {
    int counter = 0;
    for (counter = 0; counter<30000; counter++) {
        ;
                }
}

/********************************************************* 
    Interrupt Handlers
**********************************************************/

#pragma interrupt InterruptHandler_SPI

void InterruptHandler_SPI(void) {
   if(PIR1bits.SSPIF == 1)    // SPI Interrupt
    {
        PIR1bits.SSPIF = 0; // clear interrupt
        spi_transmission_done = 1;
    }        
}

#pragma interrupt InterruptHandler_Nordic

void InterruptHandler_Nordic(void) {
    if(INTCON3bits.INT2IF == 1)    // Nordic Interrupt
    {
        INTCON3bits.INT2IF = 0; // clear interrupt
//        spi_write(W_REGISTER+STATUS); // Write to the STATUS register
//        spi_write(0b01111110);                // Reset
//        spi_write(FLUSH_TX);             // Flush the FIFO
        data_sent = 1;
    }
}

/*************************************************
            Initialize the PIC
**************************************************/

void initChip(){
    PORTA = 0x00;            // reset all PORT registers
    PORTB = 0x00;
    PORTC = 0x00;
    PORTD = 0x00;
    PORTE = 0x00;
    
    TRISA = 0x00;            // set all PORTA to be OUTPUT
    TRISB = 0b00000101;        // set RB0 and RB2 as INPUT
                            // and the rest of PORTB as OUTPUT
    TRISC = 0x00;            // set all PORTC to be OUTPUT
    TRISD = 0x00;            // set all PORTD to be OUTPUT
    TRISE = 0x00;            // set up PORTE to be OUTPUT
    
    ADCON1 = 0b00001111;    // set up PORTA to be digital I/Os
    
    spi_transmission_done = 0; // initilize variables
    data_sent = 0;
    dummy = 0b00000000;
    data = 0b11111111;
}

/*************************************************
            Initialize the SPI Master
**************************************************/

void init_spi_master() {

    SDI = 1;    // Serial Data In             - enable master mode
    SCK = 0;    // Serial Clock                - clear TRISB1 for master
    SDO = 0;    // Serial Data Out             - clear TRISC7
    SS = deselect;

    SMP = 0;    // Sample bit                 - sample in middle
    CKP = 0;    // Clock Polarity            - low when idle        **MUST BE SAME ON MASTER AND SLAVE**
    CKE = 0;    // Clock Edge Select        - transmit on transition from idle clock state to active
    
    SSPCON1bits.SSPM3 = 0;    // Set the clock rate in master mode
    SSPCON1bits.SSPM2 = 0;    // to be FOSC/16 (Frequency of Oscillation)
    SSPCON1bits.SSPM1 = 0;
    SSPCON1bits.SSPM0 = 1;
    
    SSPEN = 0;    // Wait to enable serial port and configure SCK, SDO, SDI and SS as serial port pins

    PIE1bits.SSPIE = 1;    // enable SPI interrupt
}

/*************************************************
            Initialize the Nordic
**************************************************/

void init_nordic() {
    
    RCONbits.IPEN = 1;            // enable priorities levels on interrupts
    INTCON3bits.INT2IE = 1;        // enable the INT2 (IRQ) external interrupt
    INTCON3bits.INT2IP = 1;        // IRQ is high priority
    INTCON2bits.INTEDG2 = 0;    // IRQ is triggered on falling edge
    
    spi_write(W_REGISTER+CONFIG);     // Write to the CONFIG register
    spi_write(0b01001110);                // [7] Reserved
                                      // [6] RX_DR Interrupt 1 - mask
                                      // [5] TX_DS Interrupt 0 - unmask
                                      // [4] MAX_RT Interrupt
                                      // [3] Enable CRC
                                      // [2] 2 byte CRC
                                      // [1] PWR_UP
                                      // [0] TX
    spi_write(W_REGISTER+SETUP_AW); // Write to the SETUP_AW register
    spi_write(0b00000011);                // Set the width to 5 bytes
    spi_write(FLUSH_TX);             // Flush the FIFO
    
    CE = 0;                            // hold CE low to transmit
}

/*************************************************
            Functions for Writing Data
**************************************************/

void spi_write(int data) {
    
    SSPEN = 1;               // Enable serial port and configure SCK, SDO, SDI and SS as serial port pins
    
    if(WCOL == 0) {        // collision testing
        SS = select;
        SSPBUF = data;
        SS = deselect;        
    }
    else {                   // there is a collision
        WCOL = 0;
        WCOL_LED = !WCOL_LED; //visual to see a collision
    }
    delay();  // band-aid that fixes collisions during multiple writes
}

void transmit_data(int data) {
    data_sent = 0;
    spi_write(W_TX_PAYLOAD);    // send command for transmission
    spi_write(data);            // load data
    
    CE = 1;                        // toggle CE for >10ns to send packet
    delay();             
    CE = 0;
}

/******************************************************************************/
/* Main Program                                                               */
/******************************************************************************/

void main() {

    initChip();
    init_spi_master();
    init_nordic();
    INTCONbits.GIEH = 1;    // enables all high priority interrupts
    INTCONbits.GIEL = 1;    // enables all low priority interrupts
    transmit_data(data);    // send some data

    while (1) {
        transmit_data(data);
        LED1 = !LED1;         // toggle LED - program is running
        
        dummy = SSPBUF;        // in case there is something in there, get rid of it
                
        if(spi_transmission_done == 1){
                dummy = SSPBUF;
                spi_transmission_done = 0;
        }        
        
        if(data_sent == 1){
                transmit_data(data);    // send some more data
        }
                
        delay(); // LED blinks    
        data++;
    }
}
 