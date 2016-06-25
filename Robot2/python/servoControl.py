__author__ = 'Ryan Owens'
__Creation_Date__ ='06/25/2016'
__Last_Update__='06/25/2016'

import sys
import serial
import time

class ServoControl:
    def __init__(self, serialConnection, command_terminator, debug=True):
        self.__serialConnection = serialConnection
        self.__terminator = command_terminator
        self.__SET_SERVO_0_POS = 'd'
        self.__SET_SERVO_1_POS = 'e'
        self.__STOP_SERVO_0 = 'f'
        self.__STOP_SERVO_1 = 'g'

        self.__DEBUG = debug
        self.__is_stopped = True
        self.__servo_0_position = 0
        self.__servo_1_position = 0
        self.__servo_0_origin = 0
        self.__servo_1_origin = 0

    def set_servo_0_position(self, position):
        self.__serialConnection.send_command(self.__SET_SERVO_0_POS, position, self.__terminator)
        if self.__DEBUG:
            print("Setting servo 0 to positon " + position)
            print(self.__serialConnection.get_response())
        self.__servo_0_position = position

    def set_servo_1_position(self, position):
        self.__serialConnection.send_command(self.__SET_SERVO_1_POS, position, self.__terminator)
        if self.__DEBUG:
            print("Setting servo 1 to positon " + position)
            print(self.__serialConnection.get_response())
        self.__servo_1_position = position

    def stop_servo_0(self):
        self.__serialConnection.send_command(self.__STOP_SERVO_0, self.__terminator)
        if self.__DEBUG:
            print("Stopping servo 0")
            print(self.__serialConnection.get_response())

    def stop_servo_1(self):
        self.__serialConnection.send_command(self.__STOP_SERVO_1, self.__terminator)
        if self.__DEBUG:
            print("Stopping servo 1")
            print(self.__serialConnection.get_response())

    def stop_servos(self):
        if self.__DEBUG:
            print("Stopping Servos.")
        self.stop_servo_0()
        self.stop_servo_1()

    def return_servos_to_origin(self):
        if self.__DEBUG:
            print("Returning servos to origin.")
        self.set_servo_0_position(self.__servo_0_origin)
        self.set_servo_1_position(self.__servo_1_origin)
