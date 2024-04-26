
/////////////////////////////// COMMAND WORDS /////////////////////////////////
#define R_REGISTER 0b00000000 // last 5 digits should be a register name
#define W_REGISTER 0b00100000 // last 5 digits should be a register name
#define R_RX_PAYLOAD 0b01100001
#define W_TX_PAYLOAD 0b10100000
#define FLUSH_TX 0b11100001
#define FLUSH_RX 0b11100010
#define REUSE_TX_PL 0b11100011
#define ACTIVATE 0b01010000
#define R_RX_PL_WID 0b01100000
#define W_ACK_PAYLOAD 0b10101000 // last 3 digits are PPP range(000-101)
#define W_TX_PAYLOAD_NOACK 0b1011000
#define NRF_NOP 0b11111111 //No Operation. Might be used to read the STATUS register
//////////////////////////////////////////////////////////////////////////////

/////////////////////////////// REGISTER MAP //////////////////////////////////
#define CONFIG            0b00000000
#define EN_AA             0b00000001
#define EN_RXADDR         0b00000010
#define SETUP_AW          0b00000011
#define SETUP_RETR        0b00000100
#define RF_CH             0b00000101
#define RF_SETUP          0b00000110
#define NRF_STATUS        0b00000111
#define OBSERVE_TX        0b00001000
#define CD                0b00001001
#define RX_ADDR_P0        0b00001010
#define RX_ADDR_P1        0b00001011
#define RX_ADDR_P2        0b00001100
#define RX_ADDR_P3        0b00001101
#define RX_ADDR_P4        0b00001110
#define RX_ADDR_P5        0b00001111
#define TX_ADDR           0b00010000
#define RX_PW_P0          0b00010001
#define RX_PW_P1          0b00010010
#define RX_PW_P2          0b00010011
#define RX_PW_P3          0b00010100
#define RX_PW_P4          0b00010101
#define RX_PW_P5          0b00010110
#define FIFO_STATUS       0b00010111
///////////////////////////////////////////////////////////////////////////////

void initNRF24() {
    
    CE_TRIS = 0;
    
    rawSendSPI(W_REGISTER | CONFIG);     // Write to the CONFIG register
    rawSendSPI(0b01001110);                // [7] Reserved
                                      // [6] RX_DR Interrupt 1 - mask
                                      // [5] TX_DS Interrupt 0 - unmask
                                      // [4] MAX_RT Interrupt
                                      // [3] Enable CRC
                                      // [2] 2 byte CRC
                                      // [1] PWR_UP
                                      // [0] TX
    rawSendSPI(W_REGISTER | SETUP_AW); // Write to the SETUP_AW register
    rawSendSPI(0b00000011);                // Set the width to 5 bytes
    rawSendSPI(FLUSH_TX);             // Flush the FIFO
    
    CE = 0;                            // hold CE low to transmit
    
}

void writeNRF(int register_map, int data) {
    rawSendSPI(W_REGISTER | register_map);
    rawSendSPI(data);
}

uint8_t readNRF(int register_map) {
    rawSendSPI(R_REGISTER | register_map);
    return rawReadSPI();
}

void transmit_data(int data) {
//    data_sent = 0;
    rawSendSPI(W_TX_PAYLOAD);    // send command for transmission
    rawSendSPI(data);            // load data
    
    CE = 1;                        // toggle CE for >10ns to send packet
    __delay_us(50);           
    CE = 0;
}

uint8_t receive_data() {
//    data_sent = 0;
    rawSendSPI(R_RX_PAYLOAD);    // send command for transmission
    uint8_t data = rawReadSPI();            // load data
    
    CE = 1;                        // toggle CE for >10ns to send packet
    __delay_us(50);           
    CE = 0;
    
    return data;
}