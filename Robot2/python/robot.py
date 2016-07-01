__authors__ = 'Zach Anderson Ryan Owens'
__Creation_Date__ ='06/30/2016'
__Last_Update__ = '07/01/2016'

from serialCommunication import SerialCommunication
from servoControl import ServoControl
from motorControl import MotorControl
from sensorControl import SensorControl
from Command import Command
from Command import Drive
from Command import Turn


GAME_TIME = 110
port = "/dev/ttyAMA0"
baud_rate = 115200
command_terminator = "\x07"

serial_connection = SerialCommunication(port=port, baud_rate=baud_rate)
motor_controller = MotorControl(serialConnection=serial_connection, command_terminator=command_terminator, debug=True)
servo_controller = ServoControl(serialConnection=serial_connection, command_terminator=command_terminator, debug=True)
sensor_controller = SensorControl(serialConnection=serial_connection, command_terminator=command_terminator, degug=True)

while(no_light()):
    pass # shouldn't enter too tight of a loop with the sleep in SerialCommunication

start_time = now()

# Set to object of first command
activeCommand;

while(now() - start_time < GAME_TIME):
    ret = activeCommand.execute();

    if ret is not None:
    activeCommand = ret;

    # Update PID
    motorControl.update();

motorControl.stop();

# Wait for light
# Drive backward until pipe
# Simultaneously:
#     Lower trunk
#     Turn right 90 deg
# CommandGroup([LowerTrunk(), Turn(90, speed)], PickUpBalls())
# Pick up balls down the center aisle
# Encounter Robot:                           Do not encounter robot:
#     Drive backward until gate                  Drive forward until wall
#     Turn right pi / 2 rad                      Turn right 5400 arc minutes
#     Drive backward through gate                Drive backwards until pink/blue line
#     Turn right 100 grad                        Follow line backwards until hit bin
#     Drive backward to first bin                Dump bin
#     Turn left 64 brad                          Stop
#     Drive backward to bin
#     Dump bin
#     Stop
