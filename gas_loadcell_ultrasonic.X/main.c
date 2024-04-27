#include "includes.h"


void main(void) {

  // inits / deinits
  interrupts_init();
  comparator_deinit();
  timer1_init();

  lcd_init();
#ifdef MQ6_TURN
  mq6_init();
#endif
#ifdef LOAD_CELL_TURN
  load_cell_init();
#endif
#ifdef ULTRASONIC_TURN
  ultrasonic_init();
#endif

  // indicator led
  LED_TRIS = 1;


  // Main Routine
  while (1) {

    LED_PORT = !LED_PORT;
    __delay_ms(500);

#ifdef MQ6_TURN

#endif

#ifdef LOAD_CELL_TURN

#endif

#ifdef ULTRASONIC_TURN

#endif

  }

  return;
}

void __interrupt() ISR(void) {

  
  return;

}
