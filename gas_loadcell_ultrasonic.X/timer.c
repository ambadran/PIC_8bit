#include "includes.h"

void timer1_init(void) {

  RD16 = 1;
  T1CONbits.T1CKPS = 0b00;
  T1OSCEN = 0;
  TMR1CS = 0;

  //TODO:
  TMR1ON = 0;

}
