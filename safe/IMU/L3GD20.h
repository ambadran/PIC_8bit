#include "I2C.h"


// using the adafruit module, the SDO value is equal 1

unsigned char L3GD20_rawRead(int address) {

  unsigned char data;

  //master reading one byte sequence
  start_condition(); // ST
  rawSend(0b11010110); // SAD+W Assuming SDO=1
  rawSend(address); // SUB (WHO_AM_I) NOTE that it is missing a digit and that's okay
  restart_condition(); // SR
  rawSend(0b11010111); // SAD+R Assuming SDO=1
  data = rawRead_oneByte(); // DATA read
  stop_condition(); //SP

  __delay_ms(50);

  return data;
}
