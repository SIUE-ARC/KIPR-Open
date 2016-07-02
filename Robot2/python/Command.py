__authors__ = 'Ryan Owens Zach Anderson'
__Creation_Date__ ='06/30/2016'
__Last_Update__ = '07/02/2016'

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

# Moves `distance` cm at a rate of `speed` cm/s. Upon completion schedules `next`
# to be executed
class Drive(Command):
    def __init__(self, motor_control, speed = 0, distance = 0, next = None):
        super().__init__(motor_control)
        # Need to know speed in ticks / second
        # cm / second * ticks / cm = ticks / second
        self.__speed_ticks = speed * self.__TICKS_PER_CM
        self.__next = next
        self.__target_ticks = distance * self.__TICKS_PER_CM
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

        error = target_ticks - avgDelta

        if abs(error) < TOLERANCE:
            return self.__next

        # TODO Need to add proportinal constant?
        else:
            motor_control.mav(self.__speed_ticks * signum(error), self.__speed_ticks * signum(error))


# Turns `angle` degrees at a rate of `speed` degrees/s where `angle` < 0 means counter clockwise.
# Schedules `next` to be executed upon completion
class Turn(Command):
    def __init__(self, motor_controller, angle = 0, speed = 0, next = None):
        super().__init__(motor_controller)

        radius = self.__WHEELBASE / 2

        # Linear distance a single track will travel in cm
        wheel_arc = radius * math.radians(angle)

        # Number of ticks each encoder should turn (In opposite directions)
        self.__target_ticks = wheel_arc * self.__TICKS_PER_CM

        tangent_speed = radius.math.radians(speed)
        self.__speed_ticks = tangent_speed * self.__TICKS_PER_CM

        self.__start_ticks_1
        self.__start_ticks_2
        self.__started = False
        self.__next = next;
        

    def execute(self):
        if self.__started is False:
            # Set start_ticks_1/2 to current ticks
            self.__started = True

        delta1 = self.__current_ticks_1 - self.__start_ticks_1
        delta2 = self.__current_ticks_2 - self.__start_ticks_2
        avgDelta = (abs(delta1) + abs(delta2)) / 2.0

        # If the right encoder has turned more than the left, we turned left
        if delta2 > delta1:
            avgDelta = -avgDelta

        error = self.__target_ticks - avgDelta

        if abs(error) < TOLERANCE:
            return self.__next

        # TODO Need to add proportinal constant?
        else:
            # If we need to turn left, error < 0, left motor should go backwards and right
            # motor should go forwards
            motor_control.mav(self.__speed_ticks * signum(error), self.__speed_ticks * -signum(error))

