/*
 * File:   main.c
 * Author: ambadran717
 *
 * Created on March 5, 2022, 11:01 PM
 */


#include <xc.h>
#include <pic18f45k22.h>
#include <stdbool.h>
#include <stdint.h>
#include "config.h"
#include "oscillator.h"
#include "GPIO.h"
#include "UART.h"
#include "I2C.h"
#include "MPU6050.h"

int test = 0;
int accel[3] = {0, 0, 0};
int gyro[3] = {0, 0, 0};
int temp = 0;

bool start = false;

void main(void) {
    
    // oscillator
    set_internal_oscillator_with_PLL();
    
    // GPIO
    setGPIO();
    
    // UART
    initUART1(115200);
    
    //I2C
    init_I2C_Master1(100000);
    
    // MPU6050
    init_MPU6050();
    
    // Main Routine
    while(1) {
        if(button) {
            start = ~start;
            __delay_ms(300);
        }
        
        if(start) {  
            print(71);
            print(95);
            print(88);
        }
    }
    
    return;
}
