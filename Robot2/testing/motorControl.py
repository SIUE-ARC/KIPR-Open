__author__ = 'Ryan Owens'

import sys
import serial
import time

class MotorControl:
    __MAV = "a"
    __MOV = "b"
    __GETV = "c"
    __STOP = "l"
    __RUNNING_COUNT_ENCODER_1 = "h"
    __RUNNING_COUNT_ENCODER_2 = "i"
    __RESET_RUNNING_COUNT_ENCODER_1 = "j"
    __RESET_RUNNING_COUNT_ENCODER_2 = "k"
    __FORWARD = "m"
    __BACKWARD = "n"
    __LEFT = "o"
    __RIGHT = "p"
