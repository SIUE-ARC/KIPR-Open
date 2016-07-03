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


TICKS_PER_REV = 96
TICKS_PER_DEG = TICKS_PER_REV / 360.0
serial_connection = SerialCommunication(port=port, baud_rate=baud_rate)

try:
    motor_controller = MotorControl(serialConnection=serial_connection, command_terminator=command_terminator, debug=False)
    servo_controller = ServoControl(serialConnection=serial_connection, command_terminator=command_terminator, debug=False)
#    motor_controller.reset_encoders_count()
    last1Ticks = 0
    last2Ticks = 0
    print("Hello World")
    motor_controller.move_at_velocity(30)
    while True:
        leftTicks = motor_controller.get_encoder_1_count()
        time.sleep(0.1);
        rightTicks = motor_controller.get_encoder_2_count()

        #if leftTicks != last1Ticks or rightTicks != last2Ticks:
            #print(str(leftTicks) + " = " + str(leftTicks / TICKS_PER_DEG) + "\t" + str(rightTicks) + " = " + str(rightTicks /TICKS_PER_DEG))
            #print(str(leftTicks) + "\t" + str(rightTicks))

        last1Ticks = leftTicks
        last2Ticks = rightTicks
        time.sleep(0.1);
        motor_controller.update();

        time.sleep(0.1);


finally:
    print(str(motor_controller.get_encoder_1_count()) + "\t" + str(motor_controller.get_encoder_2_count()))
    motor_controller.stop()
    serial_connection.close_connection()
    print("Done")

