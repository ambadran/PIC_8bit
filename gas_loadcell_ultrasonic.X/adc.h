#ifndef ADC_H
#define ADC_H

void adc_init(uint8_t num_pins, uint8_t Vss_ref, uint8_t Vdd_ref);
void adc_choose_pin(uint8_t pin_num);
uint16_t readADC(uint8_t pin);

#endif
