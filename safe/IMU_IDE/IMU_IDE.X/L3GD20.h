
/*************************** REGISTER DEFINITION ******************************/
#define WHO_AM_I 0b0001111
#define CTRL_REG1 0b0100000
#define CTRL_REG2 0b0100001
#define CTRL_REG3 0b0100010
#define CTRL_REG4 0b0100011
#define CTRL_REG5 0b0100100
#define REFERENCE 0b0100101
#define OUT_TEMP 0b0100110
#define STATUS_REG 0b0100111
#define OUT_X_L 0b0101000
#define OUT_X_H 0b0101001
#define OUT_Y_L 0b0101010
#define OUT_Y_H 0b0101011
#define OUT_Z_L 0b0101100
#define OUT_Z_H 0b0101101
#define FIFO_CTRL_REG 0b0101110
#define FIFO_SRC_REG 0b0101111
#define INT1_CFG 0b0110000
#define INT1_SRC 0b0110001
#define INT1_TSH_XH 0b0110010
#define INT1_TSH_XL 0b0110011
#define INT1_TSH_YH 0b0110100
#define INT1_TSH_YL 0b0110101
#define INT1_TSH_ZH 0b0110110
#define INT1_TSH_ZL 0b0110111
#define INT1_DURATION 0b0111000
/*****************************************************************************/

unsigned char L3GD20_Read(unsigned char address) {
    
    unsigned char data;
    
    //master reading one byte sequence
    start_condition(); // ST
    rawSend(0b11010110); // SAD+W Assuming SDO=1
    rawSend(address); // SUB, NOTE that it is missing a digit and that's okay
    restart_condition(); // SR
    rawSend(0b11010111); // SAD+R Assuming SDO=1
    data = rawRead(); // DATA read
    stop_condition(); //SP
    
    return data; 
}

void L3GD20_write(unsigned char address, unsigned char data) {
    
    //master writing one byte sequence
    start_condition(); // ST
    rawSend(0b11010110); // SAD+W Assuming SDO=1
    rawSend(address); // SUB, NOTE that it is missing a digit and that's okay
    rawSend(data); // DATA
    stop_condition(); //SP
}

void L3GD20_PowerDown() {
    
}

void L3GD20_sleep() {
    
}

void FIFO_setup() {
    
}

void L3GD20_restart_memory() {
    L3GD20_write(CTRL_REG5, 0b10000000);
}

void init_L3GD20() {
    
//The following general-purpose sequence can be used to configure the device:
//1. Write CTRL_REG2
//2. Write CTRL_REG3
//3. Write CTRL_REG4
//4. Write CTRL_REG6
//5. Write REFERENCE
//6. Write INT1_THS
//7. Write INT1_DUR
//8. Write INT1_CFG
//9. Write CTRL_REG5
//10. Write CTRL_REG1
    
    __delay_ms(100); // it takes 10ms to load "calibration coefficients from the embedded flash to the internal registers"
    
    /////////////////////////////////////////////////////////////////////
    // setting up control register 2
    
    // first two bits must be 0 according to datasheet
    
    //HPM = 0b00; // High-pass filter mode selection => default mode, table24, pg33
    //HPCF = 0b0110; // High-pass filter cut off frequency = 0.1Hz
    // after many trial and error 0.1 cutoff frequency does the best
    
    // so value = 0b00 00 0011;
//    L3GD20_write(CTRL_REG2, 0b00000100);
    L3GD20_write(CTRL_REG2, 0b00000110);

    
    /////////////////////////////////////////////////////////////////////
    // setting up control register 3
    
    // I1_Int1 = 0; // interrupt enable on INT1 pin. Default value 0. (0: disable; 1: enable)
    // I1_Boot = 0; // Boot status available on INT1. Default value 0. (0: disable; 1: enable)
    // H_Lactive = 0; // Interrupt active configuration on INT1. Default value 0. (0: high; 1:low)
    // PP_OD = 0; // Push-pull / Open drain. Default value: 0. (0: push- pull; 1: open drain)
    // I2_DRDY = 0; // Date-ready on DRDY/INT2. Default value 0. (0: disable; 1: enable)
    // I2_WTM = 0; // FIFO watermark interrupt on DRDY/INT2. Default value: 0. (0: disable; 1: enable)
    // I2_ORun = 0; // FIFO overrun interrupt on DRDY/INT2 Default value: 0. (0: disable; 1: enable)
    // I2_Empty = 0; // FIFO empty interrupt on DRDY/INT2. Default value: 0. (0: disable; 1: enable)
    
    // so value = 0b0000 0000;
    L3GD20_write(CTRL_REG3, 0b00000000);
    
    /////////////////////////////////////////////////////////////////////
    // setting up control register 4
    
    //datasheet says bit4 (starting from 0 and counting from left) must not be changed
    // so i will read it and change only the other bits
    uint8_t tmp;
    tmp = L3GD20_Read(CTRL_REG4);
    
    // BDU = 1; // Block data update. Default value: 0
    //(0: continuos update; 1: output registers not updated until MSb and LSb read- ing)
    
    // BLE = 0; // Big/little endian data selection. Default value 0.
    //(0: Data LSb @ lower address; 1: Data MSb @ lower address)
    
    // FS = 0b00; // range of data output is 0-250 degrees per second
    
    // bit3 (counting from right and starting from 0) is not implemented
    // bit1 and bit 2 should not be changed
    
    // SIM = 0; // SPI communication 3/4 wire mode
    
    //so value should be 0b0 0 11 _ __ 0
    
    // to set the bit (tmp |= 1 << n)  
    // to clear the bit (tmp &= ~(1 << n))
    // the n is from the right to left and counting from 0
    
    tmp |= 1 << 7;
    tmp &= ~(1 << 6);
    tmp &= ~(1 << 5);
    tmp &= ~(1 << 4);
    L3GD20_write(CTRL_REG4, tmp);
    
    /////////////////////////////////////////////////////////////////////
    // setting up control register 5
    
    // BOOT = 0; // Reboot memory content. Default value: 0 
    // (0: normal mode; 1: reboot memory content)
    
    // FIFO_EN = 0; // FIFO enable. Default value: 0 (0: FIFO disable; 1: FIFO Enable)
    
    // HPen = 1; // High-pass filter enable. Default value: 0
    // (0: HPF disabled; 1: HPF enabled See Figure 20)
    
    // INT1_Sel = 0b00; // NT1 selection configuration. Default value: 0
    
    // OUT_Sel = 0b11; // Out selection configuration==> from low pass filter only
    // LOOK AT FIGURE 18 TO UNDERSTAND WHAT OUT_SEL AND INT1_SEL BITS CONTROL
    // 00 output from low pass filter
    // 01 output form low pass then high pass
    // 10/11 output form low pass then high pass then another low pass filter
    
    // so value = 0b0 0 _ 1 00 01;
    L3GD20_write(CTRL_REG5, 0b00000001);
    
    /////////////////////////////////////////////////////////////////////
    // setting up control register 1
    
    // DR = 0b00; // ODR(output data rate) = 95Hz
    // BW = 0b00; // bandwidth cutoff = 30
    // from page 31-32 table 20 in datasheet, I bookmarked a website that 
    // kind of explains the meaning of each term
    
    //setting power mode to normal
    // PD = 1
    // Xen, Yen, Zen = 1, 1, 1; // enabling all axis
    
    // so value = 11 00 1 111
//    L3GD20_write(CTRL_REG1, 0b11001111);
    L3GD20_write(CTRL_REG1, 0b00001111);
    
    // refrence for the high pass filter
    L3GD20_write(REFERENCE, 0b00000001); 
    
    __delay_ms(100); // it takes 10ms to load "calibration coefficients from the embedded flash to the internal registers"
}

int readTemp() {
    return L3GD20_Read(OUT_TEMP);
}

