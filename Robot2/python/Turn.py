__author__ = 'Zach Anderson'
__Creation_Date__ = '06/30/2016'
__Last_Update__ = '06/30/2016'

from Command import Command
import math

class Turn(Command):
    def __init__(self, motor_controller, angle):
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
