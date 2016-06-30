__author__ = 'Ryan Owens'
__Creation_Date__ ='06/30/2016'
__Last_Update__ = '06/30/2016'

class sensorControl:
    def __init__(self, serialConnection, command_terminator, debug=True):
        self.__serialConnection = serialConnection
        self.__terminator = command_terminator
        self.__DEBUG = debug

        self.__GET_LIGHT_SENSOR_VALUE = 'r'
