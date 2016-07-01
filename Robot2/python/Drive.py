__author__ = 'Zach Anderson'
__Creation_Date__ = '06/30/2016'
__Last_Update__ = '06/30/2016'

from Command import Command

class Drive(Command):
    def __init__(self, motor_control, speed, distance, next):
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
