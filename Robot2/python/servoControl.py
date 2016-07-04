__author__ = 'Ryan Owens'
__Creation_Date__ ='06/25/2016'
__Last_Update__='07/04/2016'

import sys
import serial
import time

class ServoControl:
    def __init__(self, serialConnection, command_terminator,  debug=True):
        self.__serialConnection = serialConnection
        self.__terminator = command_terminator
        self.__SET_SERVO_0_POS = 'd'
        self.__SET_SERVO_1_POS = 'e'
        self.__STOP_SERVO_0 = 'f'
        self.__STOP_SERVO_1 = 'g'

        self._DEBUG = debug
        self.__is_stopped = True
        self.__servo_0_position = 0
        self.__servo_1_position = 0
        self.__servo_0_origin = 0
        self.__servo_1_origin = 0

    def set_servo_0_position(self, position):
        if self._DEBUG:
            print("Setting servo 0 to positon " + position)
        try:
            if self.__serialConnection.send_command(self.__SET_SERVO_0_POS, position, self.__terminator) is True:
                self.__servo_0_position = position
                return True
            else:
                return False
        except:
            raise

    def set_servo_1_position(self, position):
        if self._DEBUG:
            print("Setting servo 1 to positon " + position)
        try:
            if self.__serialConnection.send_command(self.__SET_SERVO_1_POS, position, self.__terminator) is True:
                self.__servo_1_position = position
                return True
            else:
                return False
        except:
            raise

    def stop_servo_0(self):
        if self._DEBUG:
            print("Stopping servo 0")
        try:
            return self.__serialConnection.send_command(self.__STOP_SERVO_0, self.__terminator)
        except:
            raise

    def stop_servo_1(self):
        if self._DEBUG:
            print("Stopping servo 1")
        try:
            return self.__serialConnection.send_command(self.__STOP_SERVO_1, self.__terminator)
        except:
            raise

    def stop_servos(self):
        if self._DEBUG:
            print("Stopping Servos.")
        try:
            resp1 = self.stop_servo_0()
            resp2 = self.stop_servo_1()
            return resp1 and resp2
        except:
            raise

    def return_servos_to_origin(self):
        if self._DEBUG:
            print("Returning servos to origin.")
        try:
            resp1 = self.set_servo_0_position(self.__servo_0_origin)
            resp2 = self.set_servo_1_position(self.__servo_1_origin)
            return resp1 and resp2
        except:
            raise
