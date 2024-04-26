


void initSPI(bool mode, uint8_t freq_mode) {
    /* mode = true for master,
     * mode = false for slave
     * 
     * freq_mode = 0 for Fosc/4
     * freq_mode = 1 for Fosc/16
     * freq_mode = 2 for Fosc/64
     */

    if (mode) {
        //MSSP module in SPI mode as MASTER device

        SSPSTATbits.SMP = 1; // data sampled at the trailing edge
        SSPSTATbits.CKE = 1; // clock edge, data transmission is from high to low

        SSPCON1bits.SSPEN = 1; // enable MSSP module
        SSPCON1bits.CKP = 0; // clock polarity, idle state is low
        SSPCON1bits.SSPM = freq_mode; // Master mode, frequency = Fosc/4

        SDI_TRIS = 1; // SDI
        SDO_TRIS = 0; // SDO
        SCK_TRIS = 0; // SCK
        
        SS_TRIS = 0; // SS pin

        SS = 1; // idle state
        
        GIE = 1;
        PEIE = 1;
        SSPIE = 1;
        
    } else {
        //TODO: write code for slave mode
    }

}

void rawSendSPI(unsigned char data) {
    
    SPEN = 0;
    SS = 0; // setting SS line low to enable communication
    SSPBUF = data;
    while(!BF) { // Don't use if you are using interrupts
    } 
    SS = 1; // returning SS line to its idle state
    
    
    __delay_us(10);
//    SPEN = 1;
    
    
    //TODO: should i close the SSPEN after using????
}

uint8_t rawReadSPI() {
    
    SPEN = 0;
    
    SS = 0; // setting SS line low to enable communication

//    char data;
//    SSPBUF = data;
    while(!BF) { // Don't use if you are using interrupts
    }

    uint8_t value = 0; // DEFAULT VALUE IS 0

    // TO RECEIVE DATA ////////////////////////////////////////////////
    if(BF) {// Check If Any New Data Is Received
        value = (uint8_t)SSPBUF; // Read The Buffer
        BF = 0; // Clear The Buffer-Filled Indicator Bit
        SSPIF = 0; // Clear The Interrupt Flag Bit
        SSPOV = 0; // Clear The Overflow Indicator Bit
    }

    SS = 1; // returning SS2 line to its idle state
    
    __delay_us(10);

    SPEN = 1;
    
    return value;
    
    //TODO: should i close the SSPEN after using????
}
