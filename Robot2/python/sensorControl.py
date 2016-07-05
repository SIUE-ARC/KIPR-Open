__author__ = 'Ryan Owens'
__Creation_Date__ ='06/30/2016'
__Last_Update__ = '07/04/2016'

import time
class SensorControl:
    def __init__(self, serialConnection, command_terminator, debug=True):
        self.__serialConnection = serialConnection
        self.__terminator = command_terminator
        self.__DEBUG = debug
        self.__ON = "on"
        self.__WAIT_TIME = 60 # sec

    def wait_for_light(self):
        start_time = time.perf_counter()
        while (time.perf_counter() - start_time < self.__WAIT_TIME) and (self.__ON not in self.__serialConnection.wait_for_response()):
            pass
        if start_time - curr_time >= self.__WAIT_TIME:
            return False
        return time.perf_counter() - start_time
