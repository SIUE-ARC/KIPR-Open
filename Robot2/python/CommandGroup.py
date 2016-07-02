__author__ = 'Zach Anderson'
__Creation_Date__ ='06/30/2016'
__Last_Update__ = '07/02/2016'

class CommandGroup():
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

