__authors__ = 'Ryan Owens'
__Creation_Date__ = '07/03/2016'
__Last_Update__ = '07/03/2016'
from Commands import Command

class RaiseBucket(Command):
    def __init__(self, servo_controller, debug = True):
        super().__init__(servo_controller = servo_controller)
        self.__position = 0 # TODO get actual positions

    def execute(self):
        self._servo_controller.set_servo_0_position(self.__position)
        self._servo_controller.set_servo_1_position(self.__position)
        return self._COMPLETE

class LowerBucket(Command):
    def __init__(self, servo_controller, debug = True):
        super().__init__(servo_controller = servo_controller, debug = True)
        self.__position = -1 # TODO get actual positions

    def execute(self):
        self._servo_controller.set_servo_0_position(self.__position)
        self._servo_controller.set_servo_1_position(self.__position)
        return self._COMPLETE

class StopBucket(Command):
    def __init__(self, servo_controller, debug = True):
        super().__init__(servo_controller = servo_controller, debug = True)

    def execute(self):
        self.__servo_controller.stop_servo_0()
        self.__servo_controller.stop_servo_1()
        return self._COMPLETE
