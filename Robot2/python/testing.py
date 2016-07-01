__author__ = 'Ryan Owens'
__Creation_Date__ ='06/25/2016'
__Last_Update__='07/01/2016'
from serialCommunication import SerialCommunication
from motorControl import MotorControl
from servoControl import ServoControl
import time

try:
    import RPi.GPIO as GPIO
except ImportError as e:
    print(e)
    sys.exit(1)

GPIO.setmode(GPIO.BOARD)
LED_PIN = 21
HIGH = GPIO.HIGH
LOW = GPIO.LOW
GPIO.setup(21, GPIO.OUT)
GPIO.output(LED_PIN, HIGH)

port = "/dev/ttyAMA0"
baud_rate = 115200
command_terminator = "\x07"

serial_connection = SerialCommunication(port=port, baud_rate=baud_rate)
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
GPIO.output(LED_PIN, LOW)
GPIO.cleanup()
