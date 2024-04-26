import serial
import time
from list_ports import serial_ports

ports = serial_ports()
print(f"\nReading from USBtoTTL converter in port: {ports[2]}\n")

while(True):
    with serial.Serial(ports[2], 9600) as ser:
        x = ser.read()
        print(ord(x), bin(ord(x)))


