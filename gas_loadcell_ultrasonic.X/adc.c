#include "includes.h"


void adc_init(uint8_t num_pins, uint8_t Vss_ref, uint8_t Vdd_ref) {
    
    // ADC ON
    ADON = 1;
    
    // choosing how much pins are analogue from PORTA
    ADCON1bits.PCFG = 15-num_pins;
    
    ADFM = 1; // right justification
    
    // Voltage references
    ADCON1bits.VCFG0 = Vdd_ref; // Vdd reference form Vdd or from pin AN3
    ADCON1bits.VCFG1 = Vss_ref; // Vss reference form Vss or from pin AN2

    
    // NOTE: now it works only for 48 MHz speed
    //TODO: make custom code to work for all Fosc
    ADCON2bits.ADCS = 0b010; // ADC conversion clock source Fosc/32
    ADCON2bits.ACQT = 0b101; // Acquisition time is 12 T_AD
}

void adc_choose_pin(uint8_t pin_num) {
    // making a seperate function to choose the analogue pin that we want to read 
    // from instead of putting this line in the readADC module and probably get it
    // executing too much times
    ADCON0bits.CHS = pin_num; // choosing pin
}

uint16_t readADC(uint8_t pin) {
    
    ADCON0bits.CHS = pin; // choosing pin
    
    __delay_us(22); // delaying the acquisition time
    GO_DONE = 1;
    while(GO_DONE) {
        // waiting for the ADC conversion to finish
    }
    return (ADRESH << 8) + ADRESL; // reading the analog input
}
