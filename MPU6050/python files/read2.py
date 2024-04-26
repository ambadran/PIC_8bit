import serial
from list_ports import serial_ports
import time

binFrom2sComp = lambda TC: (255 + TC)

baud_rate = 115200
ports = serial_ports()
print(f"\Reading to USBtoTTL converter in port: {ports[-1]} at baud rate: {baud_rate}\n")

max_ = 0
acceleration = [0, 0, 0]
omega = [0, 0, 0]
temperature = 0

with serial.Serial(ports[-1], baud_rate) as ser:
    while(1):

        # x = ser.readline().decode()


        buffer = ser.read_until(b'A_X: ')
        acceleration[0] = float(ser.read(5).decode().strip())
        buffer = ser.read_until(b'A_Y: ')
        acceleration[1] = float(ser.read(5).decode().strip())
        buffer = ser.read_until(b'A_Z: ')
        acceleration[2] = float(ser.read(5).decode().strip())

        buffer = ser.read_until(b'G_X: ')
        omega[0] = float(ser.read(5).decode().strip())
        buffer = ser.read_until(b'G_Y: ')
        omega[1] = float(ser.read(5).decode().strip())
        buffer = ser.read_until(b'G_Z: ')
        omega[2] = float(ser.read(5).decode().strip())

        #TODO: don't let a read_until function glock up everything, (must use timeout=)

        #TODO: reading the temperature fucks up everything
        # buffer = ser.read_until(b'TEMP: ')
        # temperature = float(ser.read(5).deocode().strip())

        print("Accelerations: ", acceleration)
        
        #TODO: x-axis omega has stupid -4.71 offset
        print("Omegas: ", omega)




