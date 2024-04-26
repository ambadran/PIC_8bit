#include "includes.h"


void comparator_deinit(void) {
  CMCONbits.CM = 0b111;

  CVREN = 0;
  CVROE = 0;
}
