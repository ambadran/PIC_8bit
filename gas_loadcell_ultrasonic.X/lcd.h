#ifndef LCD_H
#define LCD_H

#define LCD_ROWS 2
#define LCD_COLUMNS 16
#define LCD_EN_DELAY 500
/* #define lcd_set_D_pins(value) ( LCD_DATA = (value<<4) | (LCD_DATA&0b00001111) ) */
#define lcd_set_D_pins(value) ( LCD_DATA = (value<<4) | (LCD_DATA&0b00001111))

void lcd_cmd(uint8_t CMD);
void lcd_clear(void);
void lcd_init(void);
void lcd_set_cursor(uint8_t r, uint8_t c);
void lcd_write_char(char Data);
void lcd_write_string(char *str);
/* void lcd_SL(void); */
/* void lcd_SR(void); */

#endif
