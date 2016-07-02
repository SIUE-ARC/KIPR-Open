__authors__ = 'Ryan Owens Zach Anderson'
__Creation_Date__ ='06/30/2016'
__Last_Update__ = '07/02/2016'

class Command:
    def __init__(self, motor_controller=None, servo_controller=None, sensor_controller=None, debug=True):
        self.__motor_controller = motor_controller
        self.__servo_controller = servo_controller
        self.__sensor_controller = sensor_controller
        self.__DEBUG = debug
        self.__WHEELBASE = 25
        self.__TICKS_PER_CM = 2

    def execute(self):
        pass

    def then(self, command):
        self.__next = command
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

