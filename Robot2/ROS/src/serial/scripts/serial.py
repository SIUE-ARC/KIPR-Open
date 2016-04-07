#!/usr/bin/env python
import serial, rospy, time
from std_msgs.msg import String

SERIAL_PORT = ""
BAUD_RATE = 115200

RX_TOPIC = ""
TX_TOPIC = ""

serial_connection = serial.Serial()

def init_module():
    # initialize the serial connection
    try:
        serial_connection.port = SERIAL_PORT
        serial_connection.baudrate = BAUD_RATE
        serial_connection.timeout = 1
        serial_connection.open()
    except serial.SerialException as e:
        print(e)
        exit(1)

def callback(data):
    global serial_connection
    command, blank, command_data = str(data).partition(" ")
    command, blank, param = str(command_data).partition(" ")
    serial_connection.write(command + command_data)
