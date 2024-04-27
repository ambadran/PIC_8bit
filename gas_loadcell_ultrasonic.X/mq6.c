#include "includes.h"

static char buffer[LCD_COLUMNS];
static uint16_t current_mq6_value;

void mq6_init(void) {

  memset(buffer, 0, LCD_COLUMNS);

  MQ6_D_PIN_TRIS = 1;

  adc_init(1, 0, 0);

}

uint16_t mq6_measure(void) {
  adc_choose_pin(MQ6_A_PIN);

  //TODO: do 1024adc to ppm conversion
  return readADC(MQ6_A_PIN);
}

void mq6_routine(void) {

  if (MQ6_D_PIN_PORT) {
    current_mq6_value = mq6_measure();

    sprintf(buffer, "MQ6 Value: %d", current_mq6_value);

    lcd_set_cursor(1, 2);
    lcd_write_string(buffer);

  }

}
