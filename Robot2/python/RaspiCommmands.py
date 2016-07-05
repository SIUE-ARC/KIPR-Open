__authors__ = 'Ryan Owens'
__Creation_Date__ = '07/03/2016'
__Last_Update__ = '07/04/2016'

from Commands import Command

# read fron/back Bumper
class RaiseTrunk(Command):
    def __init__(self, Raspi = None, pin_1 = -1, pin_2 = -1,  debug = True):
        super().__init__(raspi = Raspi, debug = debug)
        self.__pin1 = pin_1
        self.__pin2 = pin_2

    def execute():
        self._raspi.set_pin_to_output(self.__pin1)
        self._raspi.set_pin_to_output(self.__pin2)
        self._raspi.set_pin_to_high(self.__pin1)
        self._raspi.set_pin_to_low(self.__pin2)
        return self._COMPLETE

class LowerTrunk(Command):
    def __init__(self, Raspi = None, pin_1 = -1, pin_2 = -1,  debug = True):
        super().__init__(raspi = Raspi, debug = debug)
        self.__pin1 = pin_1
        self.__pin2 = pin_2

    def execute():
        self._raspi.set_pin_to_output(self.__pin1)
        self._raspi.set_pin_to_output(self.__pin2)
        self._raspi.set_pin_to_low(self.__pin1)
        self._raspi.set_pin_to_high(self.__pin2)
        return self._COMPLETE

class StartConveyorbelt(Command):
    def __init__(self, Raspi = None, pin_1 = -1, pin_2 = -1, debug = True):
        super().__init__(raspi = Raspi, debug = debug)
        self.__pin1 = pin_1
        self.__pin2 = pin_2

    def execute():
        self._raspi.set_pin_to_output(self.__pin1)
        self._raspi.set_pin_to_output(self.__pin2)
        self._raspi.set_pin_to_high(self.__pin1)
        self._raspi.set_pin_to_low(self.__pin2)
        return self._COMPLETE

class StopConveyorbelt(Command):
    def __init__(self, Raspi = None, pin_1 = -1, pin_2 = -1, debug = True):
        super().__init__(raspi = Raspi, debug = debug)
        self.__pin1 = pin_1
        self.__pin2 = pin_2

    def execute():
        self._raspi.set_pin_to_output(self.__pin1)
        self._raspi.set_pin_to_output(self.__pin2)
        self._raspi.set_pin_to_low(self.__pin1)
        self._raspi.set_pin_to_high(self.__pin2)
        return self._COMPLETE

class ReadFrontBumper(Command):
    def __init__(self, Raspi = None, pin_1 = -1, debug = True):
        super().__init__(raspi = Raspi, debug = debug)
        self.__pin = pin_1
        self._input = None

    def execute():
        self._raspi.set_pin_to_input(self.__pin)
        self._input = self._raspi.get_pin_input(self._pin)
        return self._COMPLETE

class ReadRearBumper(Command):
    def __init__(self, Raspi = None, pin_1 = -1, debug = True):
        super().__init__(raspi = Raspi, debug = debug)
        self.__pin = pin_1
        self._input = None

    def execute():
        self._raspi.set_pin_to_input(self.__pin)
        self._input = self._raspi.get_pin_input(self._pin)
        return self._COMPLETE
