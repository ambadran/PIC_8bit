#ifndef CPU_MAP_H
#define CPU_MAP_H

// LED
#define LED_TRIS TRISD1
#define LED_PORT PORTDbits.RD1

/* **** LCD PINs **** */
#define LCD_DATA_TRIS TRISD
#define LCD_DATA PORTD
#define D4 PORTDbits.RD4
#define D5 PORTDbits.RD5
#define D6 PORTDbits.RD6
#define D7 PORTDbits.RD7
#define EN PORTDbits.RD2
#define RS PORTDbits.RD3
/* ****************** */



// MQ6 library
#define MQ6_D_PIN_TRIS TRISD0
#define MQ6_D_PIN_PORT PORTDbits.RD0
#define MQ6_A_PIN 0

#endif
