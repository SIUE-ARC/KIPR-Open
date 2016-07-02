__author__ = 'Ryan Owens'
__Creation_Date__ ='06/25/2016'
__Last_Update__='07/02/2016'
from serialCommunication import SerialCommunication
from motorControl import MotorControl
from servoControl import ServoControl
import time

port = "/dev/ttyACM0"
baud_rate = 115200
command_terminator = "\x07"


serial_connection = SerialCommunication(port=port, baud_rate=baud_rate)
try:
	motor_controller = MotorControl(serialConnection=serial_connection, command_terminator=command_terminator, debug=False)
	servo_controller = ServoControl(serialConnection=serial_connection, command_terminator=command_terminator, debug=False)
	print("Hello World")


	while True:
		#print(str(motor_controller.get_encoder_1_count()) + "\t" + str(motor_controller.get_encoder_2_count()))
		motor_controller.move_at_percentage(20)
		motor_controller.update();
		time.sleep(0.007);


finally:
	print(str(motor_controller.get_encoder_1_count()) + "\t" + str(motor_controller.get_encoder_2_count()))
	motor_controller.stop()
	serial_connection.close_connection()
	print("Done")

