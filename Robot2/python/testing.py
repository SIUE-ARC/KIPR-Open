__author__ = 'Ryan Owens'
__Creation_Date__ ='06/25/2016'
__Last_Update__='06/25/2016'
from serialCommunication import BaseSerial
from motorControl import MotorControl
from servoControl import ServoControl
import time

port = "/dev/ttyAMA0"
baud_rate = 115200
command_terminator = "\x07"

serial_connection = BaseSerial(port=port, baud_rate=baud_rate)
motor_controller = MotorControl(serialConnection=serial_connection, command_terminator=command_terminator, debug=True)
servo_controller = ServoControl(serialConnection=serial_connection, command_terminator=command_terminator, debug=True)
print("Hello World")
motor_controller.set_direction_Forward()
motor_controller.move_at_percentage(200)
time.sleep(2)
motor_controller.stop()
motor_controller.set_direction_Reverse()
motor_controller.move_at_percentage(200)
time.sleep(2)
motor_controller.stop()
print("Done")
serial_connection.close_connection()
