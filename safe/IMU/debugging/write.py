import serial
from list_ports import serial_ports
import time

ports = serial_ports()
print(f"\Writing to USBtoTTL converter in port: {ports[2]}\n")

while(True):
    with serial.Serial(ports[2], 9600) as ser:
        k = eval(input())
        ser.write(k)
