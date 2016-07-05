__authors__ = 'Zach Anderson Ryan Owens'
__Creation_Date__ ='06/30/2016'
__Last_Update__ = '07/04/2016'

from serialCommunication import SerialCommunication
from servoControl import ServoControl
from motorControl import MotorControl
from sensorControl import SensorControl
from Raspi import Raspi

from Commands import Command, CommandGroup
from BucketCommands import RaiseBucket, LowerBucket, StopBucket
from MotorCommands import Drive, Turn, StopMotors, DriveBackUntilTouch, DriveForwardUntilTouch
from RaspiCommands import RaiseTrunk, LowerTrunk, StartConveyorbelt, StopConveyorbelt, ReadFrontBumper, ReadRearBumper

import time

def first(command):
    return command

GAME_TIME = 110
port = "/dev/ttyACM0"
baud_rate = 115200
command_terminator = "\x07"

# Add a list of PSOC pins below this so we can directly access them

# Add a list of Raspi pins below this so we can directly access them
LED_PIN = 21

raspi = Raspi(led_pin = LED_PIN, debug = True) # Turns on LED as well
serial_connection = SerialCommunication(port=port, baud_rate=baud_rate)
motor_controller = MotorControl(serialConnection=serial_connection, command_terminator=command_terminator, debug=True)
servo_controller = ServoControl(serialConnection=serial_connection, command_terminator=command_terminator, debug=True)
sensor_controller = SensorControl(serialConnection=serial_connection, command_terminator=command_terminator, degug=True)

# Need to add arguments to the class constructors

activeCommand = first(DriveBackUntilTouch())
.then(CommandGroup([Turn(90, speed), LowerTrunk()])
.then(StartConveyorbelt())
    .ifSuccessful(
        Turn(90, speed)
        .then(Drive(-10, speed))
        .then(FollowLineBackwards())
        .then(RaiseBucket())
    .ifFailure(
        DriveBackUntilTouch()
        .then(Drive(10, speed))
        .then(Turn(90, speed))
        .then(DriveBackUntilTouch())
        .then(LowerBucket())
    .then(StopConveyorbelt())
    .then(StopMotors())
    .then(LowerTrunk())
    .then(LowerBucket())

GAME_TIME -= (time.perf_counter() + sensorControl.wait_for_light())
start_time = time.perf_counter()

# Don't forget to handle TRY-Catch blocks

while(time.perf_counter() - start_time < GAME_TIME):
    ret = activeCommand.execute();

    if ret is not None:
        activeCommand = ret;

    # Update PID
    motorControl.update();

motorControl.stop();
servo_controller.stop()
raspi.set_all_pins_to_low()
raspi.end()

# Wait for light
# Drive backward until pipe
# Simultaneously:
#     Lower trunk
#     Turn right 90 deg
# # Pick up balls down the center aisle
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
