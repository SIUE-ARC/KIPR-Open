__authors__ = 'Ryan Owens'
__Creation_Date__ = '07/03/2016'
__Last_Update__ = '07/03/2016

from Commands import Command

# read fron/back Bumper
class RaiseTrunk(Command):
    def __init__(self, Raspi = None, winch_forward = -1, winch_backward = -1,  debug = True):
        super().__init__(raspi = Raspi, debug = debug)
        self.__pin1 = winch_forward
        self.__pin2 = winch_backwared

    def execute():
        self._raspi.set_pin_to_output(self.__pin1)
        self._raspi.set_pin_to_output(self.__pin2)
        self._raspi.set_pin_to_high(self.__pin1)
        self._raspi.set_pin_to_low(self.__pin2)
        return self._COMPLETE

class LowerTrunk(Command):
    def __init__(self, Raspi = None, winch_forward = -1, winch_backward = -1,  debug = True):
        super().__init__(raspi = Raspi, debug = debug)
        self.__pin1 = winch_forward
        self.__pin2 = winch_backwared

    def execute():
        self._raspi.set_pin_to_output(self.__pin1)
        self._raspi.set_pin_to_output(self.__pin2)
        self._raspi.set_pin_to_low(self.__pin1)
        self._raspi.set_pin_to_high(self.__pin2)
        return self._COMPLETE

class StartConveyorbelt(Command):
    def __init__(self, Raspi = None, conveyor_forward = -1, conveyor_backward = -1, debug = True):
        super().__init__(raspi = Raspi, debug = debug)
        self.__pin1 = conveyor_forward
        self.__pin2 = conveyor_backward

    def execute():
        self._raspi.set_pin_to_output(self.__pin1)
        self._raspi.set_pin_to_output(self.__pin2)
        self._raspi.set_pin_to_high(self.__pin1)
        self._raspi.set_pin_to_low(self.__pin2)
        return self._COMPLETE

class StopConveyorbelt(Command):
    def __init__(self, Raspi = None, conveyor_forward = -1, conveyor_backward = -1, debug = True):
        super().__init__(raspi = Raspi, debug = debug)
        self.__pin1 = conveyor_forward
        self.__pin2 = conveyor_backward

    def execute():
        self._raspi.set_pin_to_output(self.__pin1)
        self._raspi.set_pin_to_output(self.__pin2)
        self._raspi.set_pin_to_low(self.__pin1)
        self._raspi.set_pin_to_high(self.__pin2)
        return self._COMPLETE

class ReadFrontBumper(Command):
    def __init__(self, Raspi = None, front_bumper_pin = -1, debug = True):
        super().__init__(raspi = Raspi, debug = debug)
        self.__pin = front_bumper_pin
        self._input = None

    def execute():
        self._raspi.set_pin_to_input(self.__pin)
        self._input = self._raspi.get_pin_input(self._pin)
        return self._COMPLETE

class ReadRearBumper(Command):
    def __init__(self, Raspi = None, rear_bumper_pin = -1, debug = True):
        super().__init__(raspi = Raspi, debug = debug)
        self.__pin = rear_bumper_pin
        self._input = None

    def execute():
        self._raspi.set_pin_to_input(self.__pin)
        self._input = self._raspi.get_pin_input(self._pin)
        return self._COMPLETE
