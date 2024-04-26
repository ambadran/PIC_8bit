import serial
from list_ports import serial_ports
import time

baud_rate = 115200
ports = serial_ports()
print(f"\Reading to USBtoTTL converter in port: {ports[-1]} at baud rate: {baud_rate}\n")

while(1):
    with serial.Serial(ports[-1], baud_rate) as ser:
        x = ord(ser.read())
        print(x)

