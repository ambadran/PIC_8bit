import serial
from list_ports import serial_ports
import time

baud_rate = 9600
ports = serial_ports()
print(f"\Writing to USBtoTTL converter in port: {ports[-1]} at baud rate: {baud_rate}\n")


while(True):
    with serial.Serial(ports[-1], baud_rate) as ser:

        k = chr(int(input())).encode()

        # k = eval(input())

        ser.write(k)

