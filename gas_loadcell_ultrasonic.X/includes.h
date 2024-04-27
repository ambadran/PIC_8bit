#ifndef INCLUDES_H
#define INCLUDES_H

#include <stdio.h>
#include <stdint.h>
#include <string.h>

#include "fuses.h"
#include "config.h"
#include "cpu_map.h"

#include "interrupts.h"
#include "timer.h"
#include "comparator.h"
#include "adc.h"

#include "lcd.h"

#ifdef MQ6_TURN
#include "mq6.h"
#endif

#ifdef LOAD_CELL_TURN
#include "load_cell.h"
#endif

#ifdef ULTRASONIC_TURN
#include "ultrasonic.h"
#endif



#include <xc.h>


#endif
