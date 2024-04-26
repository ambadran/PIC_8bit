from machine import Pin
import time


reader = Pin(16, Pin.IN)

writer = Pin(17, Pin.OUT)

tmp = reader.value()

print('started at', tmp)

while True:
    if tmp != reader.value():
        tmp = reader.value()
        print(tmp, end='\r')

    time.sleep(0.25)

