__authors__ = 'Ryan Owens Zach Anderson'
__Creation_Date__ ='06/30/2016'
__Last_Update__ = '07/02/2016'

class Command:
    def __init__(self, motor_controller = None, servo_controller = None, sensor_controller = None, next = None, raspi = None, debug = True):
        self._motor_controller = motor_controller
        self._servo_controller = servo_controller
        self._sensor_controller = sensor_controller
        self._DEBUG = debug
        self._WHEELBASE = 25
        self._TICKS_PER_CM = 2
        self.__next = next
        self._COMPLETE = "C"
        self._FAILURE = "F"
        self._IN_PROGRESS = "IP"
        self._raspi = raspi

    def execute(self):
        pass

    def then(self, command):
        self.__next = command
        self.__success = command
        self.__failed =
        return command

    def ifSuccessful(self, command):
        self.__success = command
        return self

    def ifFailed(self, command):
        self.__failed = command
        return self


class CommandGroup:
    def __init__(self, commands, next):
        self.__commands = commands
        self.__next = next;

    def execute():
        # Execute all commands in commands, if any command is not finished
        # the group is not finished. If a command is finished, remove it from
        # the list
        isFinished = True
        for command in self.__commands:
            if command.execute() is None:
                isFinished = false
            else:
                commands.remove(command)

        if isFinished is True:
            return self.__next;
