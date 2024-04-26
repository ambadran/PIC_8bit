/*
 * File:   main.c
 * Author: AbdulRahman Badran
 *
 * Created on August 29, 2019, 7:50 PM
 */


#include <xc.h>
#include "config.h"
#include "I2C_LCD.h"

void main(void) {
 
  I2C_Master_Init();
  LCD_Init(0x4E); // Initialize LCD module with I2C address = 0x4E
 
  LCD_Set_Cursor(1, 1);
  LCD_Write_String("I am awesome");
  LCD_Set_Cursor(2, 1);
  LCD_Write_String("alhamdullah");
  
 
  while(1) {
      LCD_SR();
      __delay_ms(350);
      LCD_SR();
      __delay_ms(350);
      LCD_SL();
      __delay_ms(350);
      LCD_SL();
      __delay_ms(350);
//      LCD_Clear();
  } 
  return;
}
