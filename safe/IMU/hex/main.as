subtitle "Microchip MPLAB XC8 C Compiler v2.32 (Free license) build 20210201212658 Og9 "

pagewidth 120

	opt flic

	processor	18F2550
include "/Applications/microchip/xc8/v2.32/pic/include/proc/18f2550.cgen.inc"
getbyte	macro	val,pos
	(((val) >> (8 * pos)) and 0xff)
endm
byte0	macro	val
	(getbyte(val,0))
endm
byte1	macro	val
	(getbyte(val,1))
endm
byte2	macro	val
	(getbyte(val,2))
endm
byte3	macro	val
	(getbyte(val,3))
endm
byte4	macro	val
	(getbyte(val,4))
endm
byte5	macro	val
	(getbyte(val,5))
endm
byte6	macro	val
	(getbyte(val,6))
endm
byte7	macro	val
	(getbyte(val,7))
endm
getword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffff)
endm
word0	macro	val
	(getword(val,0))
endm
word1	macro	val
	(getword(val,2))
endm
word2	macro	val
	(getword(val,4))
endm
word3	macro	val
	(getword(val,6))
endm
gettword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffff)
endm
tword0	macro	val
	(gettword(val,0))
endm
tword1	macro	val
	(gettword(val,3))
endm
tword2	macro	val
	(gettword(val,6))
endm
getdword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffffff)
endm
dword0	macro	val
	(getdword(val,0))
endm
dword1	macro	val
	(getdword(val,4))
endm
clrc   macro
	bcf	status,0
endm
setc   macro
	bsf	status,0
endm
clrz   macro
	bcf	status,2
endm
setz   macro
	bsf	status,2
endm
skipnz macro
	btfsc	status,2
endm
skipz  macro
	btfss	status,2
endm
skipnc macro
	btfsc	status,0
endm
skipc  macro
	btfss	status,0
endm
pushw macro
	movwf postinc1
endm
pushf macro arg1
	movff arg1, postinc1
endm
popw macro
	movf postdec1,f
	movf indf1,w
endm
popf macro arg1
	movf postdec1,f
	movff indf1,arg1
endm
popfc macro arg1
	movff plusw1,arg1
	decfsz fsr1,f
endm
	global	__ramtop
	global	__accesstop
# 55 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UFRM equ 0F66h ;# 
# 62 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UFRML equ 0F66h ;# 
# 140 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UFRMH equ 0F67h ;# 
# 180 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UIR equ 0F68h ;# 
# 236 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UIE equ 0F69h ;# 
# 292 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UEIR equ 0F6Ah ;# 
# 343 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UEIE equ 0F6Bh ;# 
# 394 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
USTAT equ 0F6Ch ;# 
# 454 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UCON equ 0F6Dh ;# 
# 505 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UADDR equ 0F6Eh ;# 
# 569 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UCFG equ 0F6Fh ;# 
# 648 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UEP0 equ 0F70h ;# 
# 756 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UEP1 equ 0F71h ;# 
# 864 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UEP2 equ 0F72h ;# 
# 972 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UEP3 equ 0F73h ;# 
# 1080 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UEP4 equ 0F74h ;# 
# 1188 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UEP5 equ 0F75h ;# 
# 1296 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UEP6 equ 0F76h ;# 
# 1404 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UEP7 equ 0F77h ;# 
# 1512 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UEP8 equ 0F78h ;# 
# 1588 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UEP9 equ 0F79h ;# 
# 1664 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UEP10 equ 0F7Ah ;# 
# 1740 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UEP11 equ 0F7Bh ;# 
# 1816 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UEP12 equ 0F7Ch ;# 
# 1892 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UEP13 equ 0F7Dh ;# 
# 1968 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UEP14 equ 0F7Eh ;# 
# 2044 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
UEP15 equ 0F7Fh ;# 
# 2120 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PORTA equ 0F80h ;# 
# 2259 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PORTB equ 0F81h ;# 
# 2369 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PORTC equ 0F82h ;# 
# 2511 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PORTE equ 0F84h ;# 
# 2550 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
LATA equ 0F89h ;# 
# 2650 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
LATB equ 0F8Ah ;# 
# 2762 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
LATC equ 0F8Bh ;# 
# 2840 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TRISA equ 0F92h ;# 
# 2845 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
DDRA equ 0F92h ;# 
# 3038 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TRISB equ 0F93h ;# 
# 3043 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
DDRB equ 0F93h ;# 
# 3260 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TRISC equ 0F94h ;# 
# 3265 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
DDRC equ 0F94h ;# 
# 3414 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
OSCTUNE equ 0F9Bh ;# 
# 3473 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PIE1 equ 0F9Dh ;# 
# 3544 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PIR1 equ 0F9Eh ;# 
# 3615 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
IPR1 equ 0F9Fh ;# 
# 3686 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PIE2 equ 0FA0h ;# 
# 3757 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PIR2 equ 0FA1h ;# 
# 3828 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
IPR2 equ 0FA2h ;# 
# 3899 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
EECON1 equ 0FA6h ;# 
# 3965 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
EECON2 equ 0FA7h ;# 
# 3972 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
EEDATA equ 0FA8h ;# 
# 3979 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
EEADR equ 0FA9h ;# 
# 3986 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
RCSTA equ 0FABh ;# 
# 3991 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
RCSTA1 equ 0FABh ;# 
# 4196 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TXSTA equ 0FACh ;# 
# 4201 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TXSTA1 equ 0FACh ;# 
# 4452 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TXREG equ 0FADh ;# 
# 4457 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TXREG1 equ 0FADh ;# 
# 4464 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
RCREG equ 0FAEh ;# 
# 4469 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
RCREG1 equ 0FAEh ;# 
# 4476 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
SPBRG equ 0FAFh ;# 
# 4481 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
SPBRG1 equ 0FAFh ;# 
# 4488 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
SPBRGH equ 0FB0h ;# 
# 4495 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
T3CON equ 0FB1h ;# 
# 4616 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TMR3 equ 0FB2h ;# 
# 4623 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TMR3L equ 0FB2h ;# 
# 4630 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TMR3H equ 0FB3h ;# 
# 4637 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
CMCON equ 0FB4h ;# 
# 4727 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
CVRCON equ 0FB5h ;# 
# 4812 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
ECCP1AS equ 0FB6h ;# 
# 4817 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
CCP1AS equ 0FB6h ;# 
# 4942 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
ECCP1DEL equ 0FB7h ;# 
# 4947 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
CCP1DEL equ 0FB7h ;# 
# 4982 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
BAUDCON equ 0FB8h ;# 
# 4987 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
BAUDCTL equ 0FB8h ;# 
# 5162 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
CCP2CON equ 0FBAh ;# 
# 5226 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
CCPR2 equ 0FBBh ;# 
# 5233 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
CCPR2L equ 0FBBh ;# 
# 5240 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
CCPR2H equ 0FBCh ;# 
# 5247 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
CCP1CON equ 0FBDh ;# 
# 5311 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
CCPR1 equ 0FBEh ;# 
# 5318 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
CCPR1L equ 0FBEh ;# 
# 5325 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
CCPR1H equ 0FBFh ;# 
# 5332 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
ADCON2 equ 0FC0h ;# 
# 5403 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
ADCON1 equ 0FC1h ;# 
# 5488 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
ADCON0 equ 0FC2h ;# 
# 5607 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
ADRES equ 0FC3h ;# 
# 5614 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
ADRESL equ 0FC3h ;# 
# 5621 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
ADRESH equ 0FC4h ;# 
# 5628 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
SSPCON2 equ 0FC5h ;# 
# 5690 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
SSPCON1 equ 0FC6h ;# 
# 5760 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
SSPSTAT equ 0FC7h ;# 
# 6008 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
SSPADD equ 0FC8h ;# 
# 6015 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
SSPBUF equ 0FC9h ;# 
# 6022 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
T2CON equ 0FCAh ;# 
# 6120 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PR2 equ 0FCBh ;# 
# 6125 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
MEMCON equ 0FCBh ;# 
# 6230 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TMR2 equ 0FCCh ;# 
# 6237 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
T1CON equ 0FCDh ;# 
# 6340 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TMR1 equ 0FCEh ;# 
# 6347 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TMR1L equ 0FCEh ;# 
# 6354 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TMR1H equ 0FCFh ;# 
# 6361 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
RCON equ 0FD0h ;# 
# 6510 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
WDTCON equ 0FD1h ;# 
# 6538 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
HLVDCON equ 0FD2h ;# 
# 6543 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
LVDCON equ 0FD2h ;# 
# 6808 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
OSCCON equ 0FD3h ;# 
# 6891 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
T0CON equ 0FD5h ;# 
# 6961 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TMR0 equ 0FD6h ;# 
# 6968 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TMR0L equ 0FD6h ;# 
# 6975 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TMR0H equ 0FD7h ;# 
# 6982 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
STATUS equ 0FD8h ;# 
# 7053 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
FSR2 equ 0FD9h ;# 
# 7060 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
FSR2L equ 0FD9h ;# 
# 7067 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
FSR2H equ 0FDAh ;# 
# 7074 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PLUSW2 equ 0FDBh ;# 
# 7081 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PREINC2 equ 0FDCh ;# 
# 7088 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
POSTDEC2 equ 0FDDh ;# 
# 7095 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
POSTINC2 equ 0FDEh ;# 
# 7102 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
INDF2 equ 0FDFh ;# 
# 7109 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
BSR equ 0FE0h ;# 
# 7116 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
FSR1 equ 0FE1h ;# 
# 7123 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
FSR1L equ 0FE1h ;# 
# 7130 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
FSR1H equ 0FE2h ;# 
# 7137 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PLUSW1 equ 0FE3h ;# 
# 7144 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PREINC1 equ 0FE4h ;# 
# 7151 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
POSTDEC1 equ 0FE5h ;# 
# 7158 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
POSTINC1 equ 0FE6h ;# 
# 7165 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
INDF1 equ 0FE7h ;# 
# 7172 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
WREG equ 0FE8h ;# 
# 7179 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
FSR0 equ 0FE9h ;# 
# 7186 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
FSR0L equ 0FE9h ;# 
# 7193 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
FSR0H equ 0FEAh ;# 
# 7200 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PLUSW0 equ 0FEBh ;# 
# 7207 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PREINC0 equ 0FECh ;# 
# 7214 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
POSTDEC0 equ 0FEDh ;# 
# 7221 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
POSTINC0 equ 0FEEh ;# 
# 7228 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
INDF0 equ 0FEFh ;# 
# 7235 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
INTCON3 equ 0FF0h ;# 
# 7327 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
INTCON2 equ 0FF1h ;# 
# 7404 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
INTCON equ 0FF2h ;# 
# 7521 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PROD equ 0FF3h ;# 
# 7528 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PRODL equ 0FF3h ;# 
# 7535 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PRODH equ 0FF4h ;# 
# 7542 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TABLAT equ 0FF5h ;# 
# 7551 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TBLPTR equ 0FF6h ;# 
# 7558 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TBLPTRL equ 0FF6h ;# 
# 7565 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TBLPTRH equ 0FF7h ;# 
# 7572 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TBLPTRU equ 0FF8h ;# 
# 7581 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PCLAT equ 0FF9h ;# 
# 7588 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PC equ 0FF9h ;# 
# 7595 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PCL equ 0FF9h ;# 
# 7602 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PCLATH equ 0FFAh ;# 
# 7609 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
PCLATU equ 0FFBh ;# 
# 7616 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
STKPTR equ 0FFCh ;# 
# 7692 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TOS equ 0FFDh ;# 
# 7699 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TOSL equ 0FFDh ;# 
# 7706 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TOSH equ 0FFEh ;# 
# 7713 "/Applications/microchip/xc8/v2.32/pic/include/proc/pic18f2550.h"
TOSU equ 0FFFh ;# 
	debug_source C
	FNCALL	_main,_init_I2C_Master
	FNCALL	_main,_print
	FNCALL	_main,_rawRead_oneByte
	FNCALL	_main,_rawSend
	FNCALL	_main,_restart_condition
	FNCALL	_main,_start_condition
	FNCALL	_main,_stop_condition
	FNCALL	_stop_condition,_wait
	FNCALL	_start_condition,_wait
	FNCALL	_restart_condition,_wait
	FNCALL	_rawSend,_wait
	FNCALL	_rawRead_oneByte,_sendNACK
	FNCALL	_rawRead_oneByte,_wait
	FNCALL	_sendNACK,_wait
	FNCALL	_init_I2C_Master,___aldiv
	FNROOT	_main
	FNCALL	intlevel2,_ISR
	global	intlevel2
	FNROOT	intlevel2
	global	_data
	global	_received
	global	_RCREG
_RCREG	set	0xFAE
	global	_SPBRG
_SPBRG	set	0xFAF
	global	_CMCONbits
_CMCONbits	set	0xFB4
	global	_TXREG
_TXREG	set	0xFAD
	global	_SSPBUF
_SSPBUF	set	0xFC9
	global	_SSPADD
_SSPADD	set	0xFC8
	global	_SSPSTAT
_SSPSTAT	set	0xFC7
	global	_SSPCON2
_SSPCON2	set	0xFC5
	global	_SSPCON1bits
_SSPCON1bits	set	0xFC6
	global	_RCIF
_RCIF	set	0x7CF5
	global	_RB3
_RB3	set	0x7C0B
	global	_BRGH
_BRGH	set	0x7D62
	global	_BRG16
_BRG16	set	0x7DC3
	global	_SPEN
_SPEN	set	0x7D5F
	global	_SYNC
_SYNC	set	0x7D64
	global	_CREN
_CREN	set	0x7D5C
	global	_TXEN
_TXEN	set	0x7D65
	global	_TMR0IE
_TMR0IE	set	0x7F95
	global	_RCIE
_RCIE	set	0x7CED
	global	_TRISB3
_TRISB3	set	0x7C9B
	global	_TRISC7
_TRISC7	set	0x7CA7
	global	_TRISC6
_TRISC6	set	0x7CA6
	global	_RC0
_RC0	set	0x7C10
	global	_TRISC0
_TRISC0	set	0x7CA0
	global	_TRMT
_TRMT	set	0x7D61
	global	_PEIE
_PEIE	set	0x7F96
	global	_GIE
_GIE	set	0x7F97
	global	_RCEN
_RCEN	set	0x7E2B
	global	_ACKSTAT
_ACKSTAT	set	0x7E2E
	global	_ACKEN
_ACKEN	set	0x7E2C
	global	_ACKDT
_ACKDT	set	0x7E2D
	global	_RSEN
_RSEN	set	0x7E29
	global	_PEN
_PEN	set	0x7E2A
	global	_SEN
_SEN	set	0x7E28
	global	_TRISB1
_TRISB1	set	0x7C99
	global	_TRISB0
_TRISB0	set	0x7C98
; #config settings
	config pad_punits      = on
	config apply_mask      = off
	config ignore_cmsgs    = off
	config default_configs = off
	config default_idlocs  = off
	config PLLDIV = "4"
	config CPUDIV = "OSC1_PLL2"
	config USBDIV = "1"
	config FOSC = "HSPLL_HS"
	config FCMEN = "OFF"
	config IESO = "OFF"
	config PWRT = "OFF"
	config BOR = "OFF"
	config BORV = "3"
	config VREGEN = "OFF"
	config WDT = "OFF"
	config WDTPS = "32768"
	config CCP2MX = "ON"
	config PBADEN = "OFF"
	config LPT1OSC = "OFF"
	config MCLRE = "ON"
	config STVREN = "OFF"
	config LVP = "OFF"
	config XINST = "OFF"
	config CP0 = "OFF"
	config CP1 = "OFF"
	config CP2 = "OFF"
	config CP3 = "OFF"
	config CPB = "OFF"
	config CPD = "OFF"
	config WRT0 = "OFF"
	config WRT1 = "OFF"
	config WRT2 = "OFF"
	config WRT3 = "OFF"
	config WRTC = "OFF"
	config WRTB = "OFF"
	config WRTD = "OFF"
	config EBTR0 = "OFF"
	config EBTR1 = "OFF"
	config EBTR2 = "OFF"
	config EBTR3 = "OFF"
	config EBTRB = "OFF"
	file	"hex/main.as"
	line	#
psect	cinit,class=CODE,delta=1,reloc=2
global __pcinit
__pcinit:
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pbssCOMRAM
__pbssCOMRAM:
	global	_data
_data:
       ds      1
	global	_received
_received:
       ds      1
	file	"hex/main.as"
	line	#
psect	cinit
; Clear objects allocated to COMRAM (2 bytes)
	global __pbssCOMRAM
clrf	(__pbssCOMRAM+1)&0xffh,c
clrf	(__pbssCOMRAM+0)&0xffh,c
psect cinit,class=CODE,delta=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
	bcf int$flags,0,c ;clear compiler interrupt flag (level 1)
	bcf int$flags,1,c ;clear compiler interrupt flag (level 2)
movlb 0
goto _main	;jump to C main() function
psect	cstackCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pcstackCOMRAM
__pcstackCOMRAM:
?_wait:	; 1 bytes @ 0x0
??_wait:	; 1 bytes @ 0x0
?_start_condition:	; 1 bytes @ 0x0
?_stop_condition:	; 1 bytes @ 0x0
?_restart_condition:	; 1 bytes @ 0x0
?_sendNACK:	; 1 bytes @ 0x0
?_rawSend:	; 1 bytes @ 0x0
?_rawRead_oneByte:	; 1 bytes @ 0x0
?_print:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_ISR:	; 1 bytes @ 0x0
??_ISR:	; 1 bytes @ 0x0
	global	?___aldiv
?___aldiv:	; 4 bytes @ 0x0
	global	print@value
print@value:	; 2 bytes @ 0x0
	global	___aldiv@dividend
___aldiv@dividend:	; 4 bytes @ 0x0
	ds   1
??_start_condition:	; 1 bytes @ 0x1
??_stop_condition:	; 1 bytes @ 0x1
??_restart_condition:	; 1 bytes @ 0x1
??_sendNACK:	; 1 bytes @ 0x1
??_rawSend:	; 1 bytes @ 0x1
??_rawRead_oneByte:	; 1 bytes @ 0x1
	global	rawSend@data
rawSend@data:	; 1 bytes @ 0x1
	global	rawRead_oneByte@Data
rawRead_oneByte@Data:	; 1 bytes @ 0x1
	ds   1
??_print:	; 1 bytes @ 0x2
	ds   2
	global	___aldiv@divisor
___aldiv@divisor:	; 4 bytes @ 0x4
	ds   4
??___aldiv:	; 1 bytes @ 0x8
	global	___aldiv@counter
___aldiv@counter:	; 1 bytes @ 0x8
	ds   1
	global	___aldiv@sign
___aldiv@sign:	; 1 bytes @ 0x9
	ds   1
	global	___aldiv@quotient
___aldiv@quotient:	; 4 bytes @ 0xA
	ds   4
?_init_I2C_Master:	; 1 bytes @ 0xE
	global	init_I2C_Master@baudRate
init_I2C_Master@baudRate:	; 4 bytes @ 0xE
	ds   4
??_init_I2C_Master:	; 1 bytes @ 0x12
??_main:	; 1 bytes @ 0x12
	ds   2
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        0
;!    BSS         2
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM           94     20      22
;!    BANK0           160      0       0
;!    BANK1           256      0       0
;!    BANK2           256      0       0
;!    BANK3           256      0       0
;!    BANK4           256      0       0
;!    BANK5           256      0       0
;!    BANK6           256      0       0
;!    BANK7           256      0       0

;!
;!Pointer List with Targets:
;!
;!    None.


;!
;!Critical Paths under _main in COMRAM
;!
;!    _main->_init_I2C_Master
;!    _stop_condition->_wait
;!    _start_condition->_wait
;!    _restart_condition->_wait
;!    _rawSend->_wait
;!    _rawRead_oneByte->_wait
;!    _sendNACK->_wait
;!    _init_I2C_Master->___aldiv
;!
;!Critical Paths under _ISR in COMRAM
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _ISR in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _ISR in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _ISR in BANK2
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _ISR in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK4
;!
;!    None.
;!
;!Critical Paths under _ISR in BANK4
;!
;!    None.
;!
;!Critical Paths under _main in BANK5
;!
;!    None.
;!
;!Critical Paths under _ISR in BANK5
;!
;!    None.
;!
;!Critical Paths under _main in BANK6
;!
;!    None.
;!
;!Critical Paths under _ISR in BANK6
;!
;!    None.
;!
;!Critical Paths under _main in BANK7
;!
;!    None.
;!
;!Critical Paths under _ISR in BANK7
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 2     2      0     754
;!                                             18 COMRAM     2     2      0
;!                    _init_I2C_Master
;!                              _print
;!                    _rawRead_oneByte
;!                            _rawSend
;!                  _restart_condition
;!                    _start_condition
;!                     _stop_condition
;! ---------------------------------------------------------------------------------
;! (1) _stop_condition                                       0     0      0       0
;!                               _wait
;! ---------------------------------------------------------------------------------
;! (1) _start_condition                                      0     0      0       0
;!                               _wait
;! ---------------------------------------------------------------------------------
;! (1) _restart_condition                                    0     0      0       0
;!                               _wait
;! ---------------------------------------------------------------------------------
;! (1) _rawSend                                              1     1      0      15
;!                                              1 COMRAM     1     1      0
;!                               _wait
;! ---------------------------------------------------------------------------------
;! (1) _rawRead_oneByte                                      1     1      0      15
;!                                              1 COMRAM     1     1      0
;!                           _sendNACK
;!                               _wait
;! ---------------------------------------------------------------------------------
;! (2) _sendNACK                                             0     0      0       0
;!                               _wait
;! ---------------------------------------------------------------------------------
;! (2) _wait                                                 1     1      0       0
;!                                              0 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _print                                                2     0      2     174
;!                                              0 COMRAM     2     0      2
;! ---------------------------------------------------------------------------------
;! (1) _init_I2C_Master                                      4     0      4     550
;!                                             14 COMRAM     4     0      4
;!                            ___aldiv
;! ---------------------------------------------------------------------------------
;! (2) ___aldiv                                             14     6      8     452
;!                                              0 COMRAM    14     6      8
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 2
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (4) _ISR                                                  0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 4
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _init_I2C_Master
;!     ___aldiv
;!   _print
;!   _rawRead_oneByte
;!     _sendNACK
;!       _wait
;!     _wait
;!   _rawSend
;!     _wait
;!   _restart_condition
;!     _wait
;!   _start_condition
;!     _wait
;!   _stop_condition
;!     _wait
;!
;! _ISR (ROOT)
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BIGRAM             7FF      0       0      21        0.0%
;!EEDATA             100      0       0       0        0.0%
;!BITBANK7           100      0       0      18        0.0%
;!BANK7              100      0       0      19        0.0%
;!BITBANK6           100      0       0      16        0.0%
;!BANK6              100      0       0      17        0.0%
;!BITBANK5           100      0       0      14        0.0%
;!BANK5              100      0       0      15        0.0%
;!BITBANK4           100      0       0      12        0.0%
;!BANK4              100      0       0      13        0.0%
;!BITBANK3           100      0       0      10        0.0%
;!BANK3              100      0       0      11        0.0%
;!BITBANK2           100      0       0       8        0.0%
;!BANK2              100      0       0       9        0.0%
;!BITBANK1           100      0       0       6        0.0%
;!BANK1              100      0       0       7        0.0%
;!BITBANK0            A0      0       0       4        0.0%
;!BANK0               A0      0       0       5        0.0%
;!BITCOMRAM           5E      0       0       0        0.0%
;!COMRAM              5E     14      16       1       23.4%
;!BITSFR               0      0       0     200        0.0%
;!SFR                  0      0       0     200        0.0%
;!STACK                0      0       0       2        0.0%
;!NULL                 0      0       0       0        0.0%
;!ABS                  0      0      16      20        0.0%
;!DATA                 0      0      16       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 26 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_init_I2C_Master
;;		_print
;;		_rawRead_oneByte
;;		_rawSend
;;		_restart_condition
;;		_start_condition
;;		_stop_condition
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	text0,class=CODE,space=0,reloc=2,group=0
	file	"main.c"
	line	26
global __ptext0
__ptext0:
psect	text0
	file	"main.c"
	line	26
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:
;incstack = 0
	callstack 27
	line	29
	
l1102:
	bcf	c:(31904/8),(31904)&7	;volatile
	line	30
	bcf	c:(31760/8),(31760)&7	;volatile
	line	31
	bsf	c:(31910/8),(31910)&7	;volatile
	line	32
	bsf	c:(31911/8),(31911)&7	;volatile
	line	33
	bsf	c:(31899/8),(31899)&7	;volatile
	line	36
	
l1104:
	movlw	(07h & ((1<<3)-1))<<0
	iorwf	((c:4020))^0f00h,c	;volatile
	line	39
	
l1106:
	bsf	c:(32663/8),(32663)&7	;volatile
	line	40
	
l1108:
	bsf	c:(32662/8),(32662)&7	;volatile
	line	41
	
l1110:
	bsf	c:(31981/8),(31981)&7	;volatile
	line	42
	
l1112:
	bsf	c:(32661/8),(32661)&7	;volatile
	line	45
	
l1114:
	bsf	c:(32101/8),(32101)&7	;volatile
	line	46
	
l1116:
	bsf	c:(32092/8),(32092)&7	;volatile
	line	47
	
l1118:
	bcf	c:(32100/8),(32100)&7	;volatile
	line	48
	
l1120:
	bsf	c:(32095/8),(32095)&7	;volatile
	line	49
	
l1122:
	bcf	c:(32195/8),(32195)&7	;volatile
	line	50
	
l1124:
	bcf	c:(32098/8),(32098)&7	;volatile
	line	51
	movlw	low(04Dh)
	movwf	((c:4015))^0f00h,c	;volatile
	line	54
	
l1126:
	movlw	low(0186A0h)
	movwf	((c:init_I2C_Master@baudRate))^00h,c
	movlw	high(0186A0h)
	movwf	((c:init_I2C_Master@baudRate+1))^00h,c
	movlw	low highword(0186A0h)
	movwf	((c:init_I2C_Master@baudRate+2))^00h,c
	movlw	high highword(0186A0h)
	movwf	((c:init_I2C_Master@baudRate+3))^00h,c
	call	_init_I2C_Master	;wreg free
	line	61
	
l1128:
	btfss	c:(31755/8),(31755)&7	;volatile
	goto	u201
	goto	u200
u201:
	goto	l1154
u200:
	line	63
	
l1130:
	movlw	high(0)
	movwf	((c:print@value+1))^00h,c
	movlw	low(0)
	movwf	((c:print@value))^00h,c
	call	_print	;wreg free
	line	64
	
l1132:
	asmopt push
asmopt off
movlw  4
movwf	(??_main+0+0+1)^00h,c,f
movlw	12
movwf	(??_main+0+0)^00h,c,f
	movlw	52
u227:
decfsz	wreg,f
	bra	u227
	decfsz	(??_main+0+0)^00h,c,f
	bra	u227
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u227
asmopt pop

	line	67
	
l1134:
	call	_start_condition	;wreg free
	line	68
	
l1136:
	movlw	(0D6h)&0ffh
	
	call	_rawSend
	line	69
	
l1138:
	movlw	(0Fh)&0ffh
	
	call	_rawSend
	line	70
	
l1140:
	call	_restart_condition	;wreg free
	line	71
	
l1142:
	movlw	(0D7h)&0ffh
	
	call	_rawSend
	line	72
	
l1144:
	call	_rawRead_oneByte	;wreg free
	movwf	((c:_data))^00h,c
	line	73
	
l1146:
	call	_stop_condition	;wreg free
	line	75
	
l1148:
	asmopt push
asmopt off
movlw  4
movwf	(??_main+0+0+1)^00h,c,f
movlw	12
movwf	(??_main+0+0)^00h,c,f
	movlw	52
u237:
decfsz	wreg,f
	bra	u237
	decfsz	(??_main+0+0)^00h,c,f
	bra	u237
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u237
asmopt pop

	line	77
	
l1150:
	movff	(c:_data),(c:print@value)
	clrf	((c:print@value+1))^00h,c
	call	_print	;wreg free
	line	79
	
l1152:
	asmopt push
asmopt off
movlw  13
movwf	(??_main+0+0+1)^00h,c,f
movlw	45
movwf	(??_main+0+0)^00h,c,f
	movlw	216
u247:
decfsz	wreg,f
	bra	u247
	decfsz	(??_main+0+0)^00h,c,f
	bra	u247
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u247
asmopt pop

	line	83
	
l1154:
	movf	((c:_received))^00h,c,w
	btfsc	status,2
	goto	u211
	goto	u210
u211:
	goto	l136
u210:
	line	84
	
l1156:
	bsf	c:(31760/8),(31760)&7	;volatile
	line	85
	goto	l1128
	
l136:
	line	86
	bcf	c:(31760/8),(31760)&7	;volatile
	goto	l1128
	global	start
	goto	start
	callstack 0
	line	91
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_stop_condition

;; *************** function _stop_condition *****************
;; Defined at:
;;		line 37 in file "I2C.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_wait
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,class=CODE,space=0,reloc=2,group=0
	file	"I2C.h"
	line	37
global __ptext1
__ptext1:
psect	text1
	file	"I2C.h"
	line	37
	global	__size_of_stop_condition
	__size_of_stop_condition	equ	__end_of_stop_condition-_stop_condition
	
_stop_condition:
;incstack = 0
	callstack 28
	line	39
	
l960:
	call	_wait	;wreg free
	line	40
	
l962:
	bsf	c:(32298/8),(32298)&7	;volatile
	line	41
	
l95:
	return	;funcret
	callstack 0
GLOBAL	__end_of_stop_condition
	__end_of_stop_condition:
	signat	_stop_condition,89
	global	_start_condition

;; *************** function _start_condition *****************
;; Defined at:
;;		line 31 in file "I2C.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_wait
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,class=CODE,space=0,reloc=2,group=0
	line	31
global __ptext2
__ptext2:
psect	text2
	file	"I2C.h"
	line	31
	global	__size_of_start_condition
	__size_of_start_condition	equ	__end_of_start_condition-_start_condition
	
_start_condition:
;incstack = 0
	callstack 28
	line	33
	
l956:
	call	_wait	;wreg free
	line	34
	
l958:
	bsf	c:(32296/8),(32296)&7	;volatile
	line	35
	
l92:
	return	;funcret
	callstack 0
GLOBAL	__end_of_start_condition
	__end_of_start_condition:
	signat	_start_condition,89
	global	_restart_condition

;; *************** function _restart_condition *****************
;; Defined at:
;;		line 43 in file "I2C.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_wait
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2,group=0
	line	43
global __ptext3
__ptext3:
psect	text3
	file	"I2C.h"
	line	43
	global	__size_of_restart_condition
	__size_of_restart_condition	equ	__end_of_restart_condition-_restart_condition
	
_restart_condition:
;incstack = 0
	callstack 28
	line	45
	
l964:
	call	_wait	;wreg free
	line	46
	
l966:
	bsf	c:(32297/8),(32297)&7	;volatile
	line	47
	
l98:
	return	;funcret
	callstack 0
GLOBAL	__end_of_restart_condition
	__end_of_restart_condition:
	signat	_restart_condition,89
	global	_rawSend

;; *************** function _rawSend *****************
;; Defined at:
;;		line 63 in file "I2C.h"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    1[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_wait
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,class=CODE,space=0,reloc=2,group=0
	line	63
global __ptext4
__ptext4:
psect	text4
	file	"I2C.h"
	line	63
	global	__size_of_rawSend
	__size_of_rawSend	equ	__end_of_rawSend-_rawSend
	
_rawSend:
;incstack = 0
	callstack 28
	movwf	((c:rawSend@data))^00h,c
	line	65
	
l968:
	call	_wait	;wreg free
	line	66
	
l970:
	movff	(c:rawSend@data),(c:4041)	;volatile
	line	67
	call	_wait	;wreg free
	line	68
	
l972:
;	Return value of _rawSend is never used
	line	69
	
l107:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rawSend
	__end_of_rawSend:
	signat	_rawSend,4217
	global	_rawRead_oneByte

;; *************** function _rawRead_oneByte *****************
;; Defined at:
;;		line 78 in file "I2C.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  Data            1    1[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_sendNACK
;;		_wait
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text5,class=CODE,space=0,reloc=2,group=0
	line	78
global __ptext5
__ptext5:
psect	text5
	file	"I2C.h"
	line	78
	global	__size_of_rawRead_oneByte
	__size_of_rawRead_oneByte	equ	__end_of_rawRead_oneByte-_rawRead_oneByte
	
_rawRead_oneByte:
;incstack = 0
	callstack 27
	line	80
	
l976:
	call	_wait	;wreg free
	line	81
	
l978:
	bsf	c:(32299/8),(32299)&7	;volatile
	line	82
	call	_wait	;wreg free
	line	83
	
l980:
	movff	(c:4041),(c:rawRead_oneByte@Data)	;volatile
	line	84
	call	_sendNACK	;wreg free
	line	85
	
l982:
	movf	((c:rawRead_oneByte@Data))^00h,c,w
	line	86
	
l113:
	return	;funcret
	callstack 0
GLOBAL	__end_of_rawRead_oneByte
	__end_of_rawRead_oneByte:
	signat	_rawRead_oneByte,89
	global	_sendNACK

;; *************** function _sendNACK *****************
;; Defined at:
;;		line 56 in file "I2C.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_wait
;; This function is called by:
;;		_rawRead_oneByte
;; This function uses a non-reentrant model
;;
psect	text6,class=CODE,space=0,reloc=2,group=0
	line	56
global __ptext6
__ptext6:
psect	text6
	file	"I2C.h"
	line	56
	global	__size_of_sendNACK
	__size_of_sendNACK	equ	__end_of_sendNACK-_sendNACK
	
_sendNACK:
;incstack = 0
	callstack 27
	line	58
	
l898:
	call	_wait	;wreg free
	line	59
	
l900:
	bsf	c:(32301/8),(32301)&7	;volatile
	line	60
	
l902:
	bsf	c:(32300/8),(32300)&7	;volatile
	line	61
	
l104:
	return	;funcret
	callstack 0
GLOBAL	__end_of_sendNACK
	__end_of_sendNACK:
	signat	_sendNACK,89
	global	_wait

;; *************** function _wait *****************
;; Defined at:
;;		line 14 in file "I2C.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_start_condition
;;		_stop_condition
;;		_restart_condition
;;		_sendNACK
;;		_rawSend
;;		_rawRead_oneByte
;; This function uses a non-reentrant model
;;
psect	text7,class=CODE,space=0,reloc=2,group=0
	line	14
global __ptext7
__ptext7:
psect	text7
	file	"I2C.h"
	line	14
	global	__size_of_wait
	__size_of_wait	equ	__end_of_wait-_wait
	
_wait:
;incstack = 0
	callstack 28
	line	15
	
l894:
	
l86:
	
	btfsc	((c:4039))^0f00h,c,(2)&7	;volatile
	goto	u11
	goto	u10
u11:
	goto	l86
u10:
	
l896:
	movff	(c:4037),??_wait+0+0	;volatile
	movlw	01Fh
	andwf	(??_wait+0+0)^00h,c
	btfss	status,2
	goto	u21
	goto	u20
u21:
	goto	l86
u20:
	line	29
	
l89:
	return	;funcret
	callstack 0
GLOBAL	__end_of_wait
	__end_of_wait:
	signat	_wait,89
	global	_print

;; *************** function _print *****************
;; Defined at:
;;		line 19 in file "main.c"
;; Parameters:    Size  Location     Type
;;  value           2    0[COMRAM] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         2       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text8,class=CODE,space=0,reloc=2,group=0
	file	"main.c"
	line	19
global __ptext8
__ptext8:
psect	text8
	file	"main.c"
	line	19
	global	__size_of_print
	__size_of_print	equ	__end_of_print-_print
	
_print:
;incstack = 0
	callstack 29
	line	20
	
l1100:
	line	22
	
l126:
	line	20
	btfss	c:(32097/8),(32097)&7	;volatile
	goto	u191
	goto	u190
u191:
	goto	l126
u190:
	
l128:
	line	23
	movff	(c:print@value),(c:4013)	;volatile
	line	24
	
l129:
	return	;funcret
	callstack 0
GLOBAL	__end_of_print
	__end_of_print:
	signat	_print,4217
	global	_init_I2C_Master

;; *************** function _init_I2C_Master *****************
;; Defined at:
;;		line 3 in file "I2C.h"
;; Parameters:    Size  Location     Type
;;  baudRate        4   14[COMRAM] long 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         4       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		___aldiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text9,class=CODE,space=0,reloc=2,group=0
	file	"I2C.h"
	line	3
global __ptext9
__ptext9:
psect	text9
	file	"I2C.h"
	line	3
	global	__size_of_init_I2C_Master
	__size_of_init_I2C_Master	equ	__end_of_init_I2C_Master-_init_I2C_Master
	
_init_I2C_Master:
;incstack = 0
	callstack 28
	line	4
	
l1092:
	bsf	c:(31896/8),(31896)&7	;volatile
	line	5
	bsf	c:(31897/8),(31897)&7	;volatile
	line	7
	
l1094:
	movf	((c:4038))^0f00h,c,w	;volatile
	andlw	not (((1<<4)-1)<<0)
	iorlw	(08h & ((1<<4)-1))<<0
	movwf	((c:4038))^0f00h,c	;volatile
	line	8
	
l1096:
	bsf	((c:4038))^0f00h,c,5	;volatile
	line	9
	movlw	low(0)
	movwf	((c:4037))^0f00h,c	;volatile
	line	10
	movlw	low(0)
	movwf	((c:4039))^0f00h,c	;volatile
	line	11
	
l1098:
	movlw	low(0B71B00h)
	movwf	((c:___aldiv@dividend))^00h,c
	movlw	high(0B71B00h)
	movwf	((c:___aldiv@dividend+1))^00h,c
	movlw	low highword(0B71B00h)
	movwf	((c:___aldiv@dividend+2))^00h,c
	movlw	high highword(0B71B00h)
	movwf	((c:___aldiv@dividend+3))^00h,c
	movff	(c:init_I2C_Master@baudRate),(c:___aldiv@divisor)
	movff	(c:init_I2C_Master@baudRate+1),(c:___aldiv@divisor+1)
	movff	(c:init_I2C_Master@baudRate+2),(c:___aldiv@divisor+2)
	movff	(c:init_I2C_Master@baudRate+3),(c:___aldiv@divisor+3)
	call	___aldiv	;wreg free
	decf	(0+?___aldiv)^00h,c,w
	movwf	((c:4040))^0f00h,c	;volatile
	line	12
	
l83:
	return	;funcret
	callstack 0
GLOBAL	__end_of_init_I2C_Master
	__end_of_init_I2C_Master:
	signat	_init_I2C_Master,4217
	global	___aldiv

;; *************** function ___aldiv *****************
;; Defined at:
;;		line 7 in file "/Applications/microchip/xc8/v2.32/pic/sources/c90/common/aldiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        4    0[COMRAM] long 
;;  divisor         4    4[COMRAM] long 
;; Auto vars:     Size  Location     Type
;;  quotient        4   10[COMRAM] long 
;;  sign            1    9[COMRAM] unsigned char 
;;  counter         1    8[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[COMRAM] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         8       0       0       0       0       0       0       0       0
;;      Locals:         6       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:        14       0       0       0       0       0       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init_I2C_Master
;; This function uses a non-reentrant model
;;
psect	text10,class=CODE,space=0,reloc=2,group=1
	file	"/Applications/microchip/xc8/v2.32/pic/sources/c90/common/aldiv.c"
	line	7
global __ptext10
__ptext10:
psect	text10
	file	"/Applications/microchip/xc8/v2.32/pic/sources/c90/common/aldiv.c"
	line	7
	global	__size_of___aldiv
	__size_of___aldiv	equ	__end_of___aldiv-___aldiv
	
___aldiv:
;incstack = 0
	callstack 28
	line	13
	
l1048:
	movlw	low(0)
	movwf	((c:___aldiv@sign))^00h,c
	line	14
	
l1050:
	btfsc	((c:___aldiv@divisor+3))^00h,c,7
	goto	u130
	goto	u131

u131:
	goto	l1056
u130:
	line	15
	
l1052:
	comf	((c:___aldiv@divisor+3))^00h,c
	comf	((c:___aldiv@divisor+2))^00h,c
	comf	((c:___aldiv@divisor+1))^00h,c
	negf	((c:___aldiv@divisor))^00h,c
	movlw	0
	addwfc	((c:___aldiv@divisor+1))^00h,c
	addwfc	((c:___aldiv@divisor+2))^00h,c
	addwfc	((c:___aldiv@divisor+3))^00h,c
	line	16
	
l1054:
	movlw	low(01h)
	movwf	((c:___aldiv@sign))^00h,c
	line	18
	
l1056:
	btfsc	((c:___aldiv@dividend+3))^00h,c,7
	goto	u140
	goto	u141

u141:
	goto	l1062
u140:
	line	19
	
l1058:
	comf	((c:___aldiv@dividend+3))^00h,c
	comf	((c:___aldiv@dividend+2))^00h,c
	comf	((c:___aldiv@dividend+1))^00h,c
	negf	((c:___aldiv@dividend))^00h,c
	movlw	0
	addwfc	((c:___aldiv@dividend+1))^00h,c
	addwfc	((c:___aldiv@dividend+2))^00h,c
	addwfc	((c:___aldiv@dividend+3))^00h,c
	line	20
	
l1060:
	movlw	(01h)&0ffh
	xorwf	((c:___aldiv@sign))^00h,c
	line	22
	
l1062:
	movlw	low(0)
	movwf	((c:___aldiv@quotient))^00h,c
	movlw	high(0)
	movwf	((c:___aldiv@quotient+1))^00h,c
	movlw	low highword(0)
	movwf	((c:___aldiv@quotient+2))^00h,c
	movlw	high highword(0)
	movwf	((c:___aldiv@quotient+3))^00h,c
	line	23
	
l1064:
	movf	((c:___aldiv@divisor))^00h,c,w
iorwf	((c:___aldiv@divisor+1))^00h,c,w
iorwf	((c:___aldiv@divisor+2))^00h,c,w
iorwf	((c:___aldiv@divisor+3))^00h,c,w
	btfsc	status,2
	goto	u151
	goto	u150

u151:
	goto	l1084
u150:
	line	24
	
l1066:
	movlw	low(01h)
	movwf	((c:___aldiv@counter))^00h,c
	line	25
	goto	l1070
	line	26
	
l1068:
	bcf	status,0
	rlcf	((c:___aldiv@divisor))^00h,c
	rlcf	((c:___aldiv@divisor+1))^00h,c
	rlcf	((c:___aldiv@divisor+2))^00h,c
	rlcf	((c:___aldiv@divisor+3))^00h,c
	line	27
	incf	((c:___aldiv@counter))^00h,c
	line	25
	
l1070:
	
	btfss	((c:___aldiv@divisor+3))^00h,c,(31)&7
	goto	u161
	goto	u160
u161:
	goto	l1068
u160:
	line	30
	
l1072:
	bcf	status,0
	rlcf	((c:___aldiv@quotient))^00h,c
	rlcf	((c:___aldiv@quotient+1))^00h,c
	rlcf	((c:___aldiv@quotient+2))^00h,c
	rlcf	((c:___aldiv@quotient+3))^00h,c
	line	31
	
l1074:
		movf	((c:___aldiv@divisor))^00h,c,w
	subwf	((c:___aldiv@dividend))^00h,c,w
	movf	((c:___aldiv@divisor+1))^00h,c,w
	subwfb	((c:___aldiv@dividend+1))^00h,c,w
	movf	((c:___aldiv@divisor+2))^00h,c,w
	subwfb	((c:___aldiv@dividend+2))^00h,c,w
	movf	((c:___aldiv@divisor+3))^00h,c,w
	subwfb	((c:___aldiv@dividend+3))^00h,c,w
	btfss	status,0
	goto	u171
	goto	u170

u171:
	goto	l1080
u170:
	line	32
	
l1076:
	movf	((c:___aldiv@divisor))^00h,c,w
	subwf	((c:___aldiv@dividend))^00h,c
	movf	((c:___aldiv@divisor+1))^00h,c,w
	subwfb	((c:___aldiv@dividend+1))^00h,c
	movf	((c:___aldiv@divisor+2))^00h,c,w
	subwfb	((c:___aldiv@dividend+2))^00h,c
	movf	((c:___aldiv@divisor+3))^00h,c,w
	subwfb	((c:___aldiv@dividend+3))^00h,c
	line	33
	
l1078:
	bsf	(0+(0/8)+(c:___aldiv@quotient))^00h,c,(0)&7
	line	35
	
l1080:
	bcf	status,0
	rrcf	((c:___aldiv@divisor+3))^00h,c
	rrcf	((c:___aldiv@divisor+2))^00h,c
	rrcf	((c:___aldiv@divisor+1))^00h,c
	rrcf	((c:___aldiv@divisor))^00h,c
	line	36
	
l1082:
	decfsz	((c:___aldiv@counter))^00h,c
	
	goto	l1072
	line	38
	
l1084:
	movf	((c:___aldiv@sign))^00h,c,w
	btfsc	status,2
	goto	u181
	goto	u180
u181:
	goto	l1088
u180:
	line	39
	
l1086:
	comf	((c:___aldiv@quotient+3))^00h,c
	comf	((c:___aldiv@quotient+2))^00h,c
	comf	((c:___aldiv@quotient+1))^00h,c
	negf	((c:___aldiv@quotient))^00h,c
	movlw	0
	addwfc	((c:___aldiv@quotient+1))^00h,c
	addwfc	((c:___aldiv@quotient+2))^00h,c
	addwfc	((c:___aldiv@quotient+3))^00h,c
	line	40
	
l1088:
	movff	(c:___aldiv@quotient),(c:?___aldiv)
	movff	(c:___aldiv@quotient+1),(c:?___aldiv+1)
	movff	(c:___aldiv@quotient+2),(c:?___aldiv+2)
	movff	(c:___aldiv@quotient+3),(c:?___aldiv+3)
	line	41
	
l228:
	return	;funcret
	callstack 0
GLOBAL	__end_of___aldiv
	__end_of___aldiv:
	signat	___aldiv,8316
	global	_ISR

;; *************** function _ISR *****************
;; Defined at:
;;		line 93 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 2
;; This function uses a non-reentrant model
;;
psect	intcode,class=CODE,space=0,reloc=2
	file	"hex/main.as"
	line	#
global __pintcode
__pintcode:
psect	intcode
	file	"main.c"
	line	93
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:
;incstack = 0
	callstack 27
	bsf int$flags,1,c ;set compiler interrupt flag (level 2)
	global	int_func
	call	int_func,f	;refresh shadow registers
psect	intcode_body,class=CODE,space=0,reloc=2
global __pintcode_body
__pintcode_body:
int_func:

	pop	; remove dummy address from shadow register refresh
	line	94
	
i2l1044:
	btfss	c:(31989/8),(31989)&7	;volatile
	goto	i2u12_41
	goto	i2u12_40
i2u12_41:
	goto	i2l146
i2u12_40:
	line	95
	
i2l1046:
	movff	(c:4014),(c:_received)	;volatile
	line	96
	bcf	c:(31989/8),(31989)&7	;volatile
	line	98
	
i2l146:
	bcf int$flags,1,c ;clear compiler interrupt flag (level 2)
	retfie f
	callstack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
	signat	_ISR,89
	GLOBAL	__activetblptr
__activetblptr	EQU	0
	psect	intsave_regs,class=BIGRAM,space=1,noexec
	PSECT	rparam,class=COMRAM,space=1,noexec
	GLOBAL	__Lrparam
	FNCONF	rparam,??,?
	GLOBAL	___rparam_used
	___rparam_used EQU 1
	GLOBAL	___param_bank
	___param_bank EQU 0
GLOBAL	__Lparam, __Hparam
GLOBAL	__Lrparam, __Hrparam
__Lparam	EQU	__Lrparam
__Hparam	EQU	__Hrparam
       psect   temp,common,ovrld,class=COMRAM,space=1
	global	btemp
btemp:
	ds	1
	global	int$flags
	int$flags	set btemp
	global	wtemp8
	wtemp8 set btemp+1
	global	ttemp5
	ttemp5 set btemp+1
	global	ttemp6
	ttemp6 set btemp+4
	global	ttemp7
	ttemp7 set btemp+8
	end
