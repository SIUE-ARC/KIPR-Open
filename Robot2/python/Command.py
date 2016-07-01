__author__ = 'Ryan Owens'
__Creation_Date__ ='06/30/2016'
__Last_Update__ = '06/30/2016'

class Command:
    def __init__(self, motor_controller=None, servo_controller=None, sensor_controller=None, debug=True):
        self.__motor_controller = motor_controller
        self.__servo_controller = servo_controller
        self.__sensor_controller = sensor_controller
        self.__DEBUG = debug
        self.__WHEELBASE = 25
        self.__TICKS_PER_CM = 2

    def execute():
        pass
