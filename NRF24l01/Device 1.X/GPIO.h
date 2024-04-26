

#define TX1_TRIS TRISC6
#define RX1_TRIS TRISC7
#define TX1_ANS ANSC6
#define RX1_ANS ANSC7

#define SDA1_TRIS TRISC4
#define SCL1_TRIS TRISC3
#define SDA1_ANS ANSC4
#define SCL1_ANS ANSC3

#define SDA2_TRIS TRISD1
#define SCL2_TRIS TRISD0
#define SDA2_ANS ANSD1
#define SCL2_ANS ANSD0

#define led PORTAbits.RA5
#define switch PORTAbits.RA4

void setGPIO() {
    
    // TRIS register
    TRISA5 = 0;
    
    // ANS register
    ANSA5 = 1;
    
}