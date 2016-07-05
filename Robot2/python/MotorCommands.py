__authors__ = 'Zach Anderson Ryan Owens'
__Creation_Date__ = '07/02/2016'
__Last_Update__ = '07/04/2016'
from Command import Command
import math
import serial

# Moves `distance` cm at a rate of `speed` cm/s. Upon completion schedules `next`
# to be executed
class Drive(Command):
    def __init__(self, motor_controller, speed = 0, distance = 0, next = None):
        super().__init__(motor_controller = motor_controller, next = next)
        # Need to know speed in ticks / second
        # cm / second * ticks / cm = ticks / second
        self.__speed_ticks = speed * self.__TICKS_PER_CM
        self.__target_ticks = distance * self.__TICKS_PER_CM
        self.__started = False
        self.__start_ticks_1
        self.__start_ticks_2
        self.__previous_movement = 0
        self.__try_get_reponse = 3

    def execute(self):
        if self.__started is False:
            self.__start_ticks = self.__currentTicks
            self.__started = True

        delta1 = self.__current_ticks_1 - self.__start_ticks_1
        delta2 = self.__current_ticks_2 - self.__start_ticks_2
        avgDelta = (delta1 + delta2) / 2.0

        error = target_ticks - avgDelta

        if abs(error) < TOLERANCE:
            return self._COMPLETE

        elif abs(error) < self.__previous_movement:
            return self._FAILURE
        else:
            # TODO Need to add proportinal constant?
            if self.__try_get_reponse > 0:
                try:
                    if self.__motor_controller.mav(self.__speed_ticks * signum(error), self.__speed_ticks * signum(error)) is True:
                        # got the ACK
                        self.__previous_movement = abs(error)
                        self.__try_get_reponse = -1
                    else:
                        # got the NACK
                        try_get_reponse -= 1
                        return self._IN_PROGRESS
                except:
                    raise
            elif self.__try_get_reponse == 0:
                # to many tries
                return self._FAILURE
            # Got ACK and are done
            return self._COMPLETE

# Turns `angle` degrees at a rate of `speed` degrees/s where `angle` < 0 means counter clockwise.
# Schedules `next` to be executed upon completion
class Turn(Command):
    def __init__(self, motor_controller, angle = 0, speed = 0, next = None):
        super().__init__(motor_controller = motor_controller, next = next)

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
        self.__previous_movement = 0
        self.__try_get_reponse = 3


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
            return self._COMPLETE

        elif abs(error) < self.__previous_movement:
            return self._FAILURE
        else:
            # TODO Need to add proportinal constant?
            # If we need to turn left, error < 0, left motor should go backwards and right
            # motor should go forwards
            if self.__try_get_reponse > 0:
                try:
                    if self.motor_controller.mav(self.__speed_ticks * signum(error), self.__speed_ticks * -signum(error)) is True:
                        self.__previous_movement = abs(error)
                        self.__try_get_reponse = -1
                    else:
                        try_get_reponse -= 1
                        return self._IN_PROGRESS
                except:
                    raise
            elif self.__try_get_reponse == 0:
                return self._FAILURE
            return self._COMPLETE

class StopMotors(Command):
    def __init__(self, motor_controller, next = None):
        super().__init__(motor_controller = motor_controller, next = next)
        self.__try_get_reponse = 3

    def execute(self):
        self.__motor_controller.stop()
        if self.__try_get_reponse > 0:
            try:
                if self.__motor_controller.stop() is True:
                    self.__previous_movement = abs(error)
                    self.__try_get_reponse = -1
                else:
                    try_get_reponse -= 1
                    return self._IN_PROGRESS
            except:
                raise
        elif self.__try_get_reponse == 0:
            return self._FAILURE
        return self._COMPLETE

class DriveBackUntilTouch(Command):
    def __init__(self, motor_controller, raspi, pin):
        super().__init__(motor_controller = motor_controller, raspi = raspi)
        self.__started = False
        self.__speed = 100 # set a speed
        self.__try_get_reponse = 3
        self.__pin = pin

    def execute(self):
        if self.__try_get_reponse > 0 and self._raspi.get_pin_input(self.__pin) != 1:
            if self.__started is True:
                # have not reached the number of tries and the bumper is not pressed
                return self._IN_PROGRESS
            else:
                try:
                    if self.__motor_controller.mav(-self.__speed, -self.__speed) is True:
                        # got the ACK
                        self.__started = True
                        self.__try_get_reponse = -1
                    else:
                        # got the NACK
                        try_get_reponse -= 1
                        return self._IN_PROGRESS
                except:
                    raise
        elif self.__try_get_reponse == 0:
                # to many tries
                return self._FAILURE
        # Got ACK and are done
        return self._COMPLETE

class DriveForwardUntilTouch(Command):
    def __init__(self, motor_controller, raspi, pin):
        super().__init__(motor_controller = motor_controller, raspi = raspi)
        self.__started = False
        self.__speed = 100 # set a speed
        self.__try_get_reponse = 3
        self.__pin = pin

    def execute(self):
        if self.__try_get_reponse > 0 and self._raspi.get_pin_input(self.__pin) != 1:
            if self.__started is True:
                # have not reached the number of tries and the bumper is not pressed
                return self._IN_PROGRESS
            else:
                try:
                    if self.__motor_controller.mav(self.__speed, self.__speed) is True:
                        # got the ACK
                        self.__started = True
                        self.__try_get_reponse = -1
                    else:
                        # got the NACK
                        try_get_reponse -= 1
                        return self._IN_PROGRESS
                except:
                    raise
        elif self.__try_get_reponse == 0:
                # to many tries
                return self._FAILURE
        # Got ACK and are done
        return self._COMPLETE

# Drive until the robot is pressed against a pipe on both sides
class SquareUp(Command):
    def __init__(self, motor_controller, speed):
        super().__init__(motor_controller = motor_controller)
        self.__speed = speed
    
    def execute(self):
        # Turn off PID, we will be driving manually
        self.__motorController.disable()

        leftSpeed = speed
        rightSpeed = speed

        # If either motor is already against a wall, don't move that motor
        if abs(self.__motor_controller.get_left_velocity()) < 10:
            leftSpeed = 0
        if abs(self.__motor_controller.get_right_velocity()) < 10:
            rightSpeed = 0

        # If both motors are against the wall, we are done
        if leftSpeed == 0 and rightSpeed == 0:
            self.__motorController.enable()
            return self._COMPLETE
        else:
            self.__motorController.move_at_percentage((leftSpeed, rightSpeed))
            return self._IN_PROGRESS
