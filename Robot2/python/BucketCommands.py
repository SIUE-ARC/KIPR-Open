__authors__ = 'Ryan Owens'
__Creation_Date__ = '07/03/2016'
__Last_Update__ = '07/04/2016'
from Commands import Command
import serial

class RaiseBucket(Command):
    def __init__(self, servo_controller, debug = True):
        super().__init__(servo_controller = servo_controller)
        self.__position = 0 # TODO get actual positions
        self.__servo_0_tries = 3

    def execute(self):
        if self.__servo_0_tries > 0:
            # have not gone through all send attempts
            try:
                if self._servo_controller.set_servo_0_position(self.__position) is False:
                    # did not get the acknowledgement
                    self.__servo_0_tries -= 1
                    return self._IN_PROGRESS
                else:
                    # did get the acknowledgement, move on to servo 1
                    self.__servo_0_tries = -1
            except serial.SerialException as e:
                # serial exception, pass up
                raise
        elif self.__servo_0_tries == 0:
            # we have gone through all send attempts
            return self._FAILURE
        # Otherwise we received an ack and are now done
        return self._COMPLETE

class LowerBucket(Command):
    def __init__(self, servo_controller, debug = True):
        super().__init__(servo_controller = servo_controller, debug = True)
        self.__position = -1 # TODO get actual positions
        self.__servo_1_tries = 3

    def execute(self):
        if self.__servo_0_tries > 0:
            # have not gone through all send attempts
            try:
                if self._servo_controller.set_servo_1_position(self.__position) is False:
                    # did not get the acknowledgement
                    self.__servo_0_tries -= 1
                    return self._IN_PROGRESS
                else:
                    # did get the acknowledgement, move on to servo 1
                    self.__servo_0_tries = -1
            except serial.SerialException as e:
                # serial exception, pass up
                raise
        elif self.__servo_0_tries == 0:
            # we have gone through all send attempts
            return self._FAILURE
        # Otherwise we received an ack and are now done
        return self._COMPLETE

class StopBucket(Command):
    def __init__(self, servo_controller, debug = True):
        super().__init__(servo_controller = servo_controller, debug = True)
        self.__servo_0_tries = 3

    def execute(self):
        if self.__servo_0_tries > 0:
            # have not gone through all send attempts
            try:
                if self._servo_controller.stop_servo_0() is False:
                    # did not get the acknowledgement
                    self.__servo_0_tries -= 1
                    return self._IN_PROGRESS
                else:
                    # did get the acknowledgement, move on to servo 1
                    self.__servo_0_tries = -1
            except serial.SerialException as e:
                # serial exception, pass up
                raise
        elif self.__servo_0_tries == 0:
            # we have gone through all send attempts
            return self._FAILURE
        # Otherwise we received an ack and are now done
        return self._COMPLETE
