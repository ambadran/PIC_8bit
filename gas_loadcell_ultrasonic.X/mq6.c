#include "includes.h"


void mq6_init(void) {

  MQ6_D_PIN_TRIS = 1;

  adc_init(1, 0, 0);

}

uint16_t mq6_measure(void) {
  adc_choose_pin(MQ6_A_PIN);

  //TODO: do 1024adc to ppm conversion
  return readADC(MQ6_A_PIN);
}

