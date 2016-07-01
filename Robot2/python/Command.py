__authors__ = 'Ryan Owens Zach Anderson'
__Creation_Date__ ='06/30/2016'
__Last_Update__ = '07/01/2016'

import math

class Command:
    def __init__(self, motor_controller=None, servo_controller=None, sensor_controller=None, debug=True):
        self.__motor_controller = motor_controller
        self.__servo_controller = servo_controller
        self.__sensor_controller = sensor_controller
        self.__DEBUG = debug
        self.__WHEELBASE = 25
        self.__TICKS_PER_CM = 2

    def execute():
        pass

class Drive(Command):
    def __init__(self, motor_control, speed = 0, distance = 0, next = None):
        super().__init__(motor_control)
        self.__speed = speed
        self.__next = next
        self.__ticks = distance * self.__TICKS_PER_CM
        self.__started = False
        self.__start_ticks_1
        self.__start_ticks_2

    def execute(self):
        if self.__started is False:
            self.__start_ticks = self.__currentTicks
            self.__started = True

        delta1 = self.__current_ticks_1 - self.__start_ticks_1
        delta2 = self.__current_ticks_2 - self.__start_ticks_2
        avgDelta = (delta1 + delta2) / 2.0

        if abs(avgDelta - ticks) < TOLERANCE:
            return self.__next
        else if avgDelta > ticks:
            motor_control.mav(self.__speed, self.__speed)
        else
            motor_control.mav(-self.__speed, -self.__speed)

class Turn(Command):
    def __init__(self, motor_controller, angle = 0):
        super().__init__(motor_controller)
        self.__angle = angle

    def execute(self):
        radius = self.__WHEELBASE / 2
        wheel_arc = radius * math.radians(self.__angle)
        ticks = wheel_arc * self.__TICKS_PER_CM

        # Set motor speeds for correct direction
        self.__motor_control.move_at_velocity()
        if abs(getEncoder1Count()) > ticks:
            # Do next thing
            pass
