__author__ = 'Ryan Owens'
__Creation_Date__ ='06/25/2016'
__Last_Update__ = '07/02/2016'

import sys
import serial
import time

class MotorControl:
    def __init__(self, serialConnection, command_terminator, debug=True):
        self.__serialConnection = serialConnection
        self.__terminator = command_terminator
        self.__MAV = "a"
        self.__MOV_1 = "b"
        self.__MOV_2 = "B"
        self.__GETV = "c"
        self.__STOP = "l"
        self.__ENCODER_1_COUNT = "h"
        self.__ENCODER_2_COUNT = "i"
        self.__RESET_ENCODER_1_COUNT = "j"
        self.__RESET_ENCODER_2_COUNT = "k"
        self.__FORWARD_1 = "m"
        self.__FORWARD_2 = "M"
        self.__REVERSE_1 = "n"
        self.__REVERSE_2 = "N"
        self.__LEFT = "o"
        self.__RIGHT = "p"

        self.__DEBUG = debug
        self.__is_moving_forward = False
        self.__is_left = False;
        self.__is_stopped = True

        # PID
        self.__then = 0
        self.__encoder_1_then = 0
        self.__encoder_2_then = 0
        self.__speed_0 = 0
        self.__speed_1 = 0
        self.__target_speed_0 = 0
        self.__target_speed_1 = 0
        self.__KP_1 = 0.04
        self.__KP_2 = 0.04


        self.stop()

    def set_direction_Forward(self):
        self.__is_stopped = False
        self.__is_moving_forward = True
        self.__serialConnection.send_command(self.__FORWARD, self.__terminator)
        if self.__DEBUG:
            print("Setting direction to forward.")
            print(self.__serialConnection.get_response())

    def set_direction_Reverse(self):
        self.__is_stopped = False
        self.__is_moving_forward = False
        self.__serialConnection.send_command(self.__REVERSE, self.__terminator)
        if self.__DEBUG:
            print("Setting direction to reverse.")
            print(self.__serialConnection.get_response())

    def set_direction_Left(self):
        self.__is_left = True
        self.__serialConnection(self.__LEFT, self.__terminator)
        if self.__DEBUG:
            print("Setting direction to left.")
            print(self.__serialConnection.get_response())


    def set_direction_Right(self):
        self.__is_left = True
        self.__serialConnection(self.__RIGHT, self.__terminator)
        if self.__DEBUG:
            print("Setting direction to Right.")
            print(self.__serialConnection.get_response())


    def move_at_velocity(self, velocity):
        pass

    def move_at_percentage(self, percentage):
        self.__is_stopped = False;
        self.__target_speed_0 = percentage;
        self.__target_speed_1 = percentage;
        if self.__DEBUG:
            print("Moving at " + str(percentage) + " %")
            print(self.__serialConnection.get_response())

    def move(self, percent):
        self.__is_stopped = False
        leftSpeed = percent[0]
        rightSpeed = percent[1]
        if leftSpeed > 0:
            self.__serialConnection.send_command(self.__FORWARD_1, self.__terminator)
        else:
            self.__serialConnection.send_command(self.__REVERSE_1, self.__terminator)

        if rightSpeed > 0:
            self.__serialConnection.send_command(self.__FORWARD_2, self.__terminator)
        else:
            self.__serialConnection.send_command(self.__REVERSE_2, self.__terminator)

        self.__serialConnection.send_command(self.__MOV_2, abs(rightSpeed), self.__terminator)
        self.__serialConnection.send_command(self.__MOV_1, abs(leftSpeed), self.__terminator)


    def stop(self):
        if self.__is_stopped is False:
            self.__is_stopped = True
            self.__serialConnection.send_command(self.__STOP, self.__terminator)
            self.__speed_0 = 0
            self.__speed_1 = 0
            self.__target_speed_0 = 0
            self.__target_speed_1 = 0
            if self.__DEBUG:
                print("Stopping")
                print(self.__serialConnection.get_response())
        else:
            if self.__DEBUG:
                print("System is already stopped, ignoring command.")

    def get_velocity(self):
        if self.__is_stopped:
            return 0.0;
        else:
            self.__serialConnection.send_command(self.__GETV, self.__terminator)
            if self.__DEBUG:
                print("Getting current velocity.")
                print(self.__serialConnection.get_response())
            # TODO confirm the result should be a double
            return float(self.__serialConnection.get_response())

    def get_encoder_1_count(self):
        self.__serialConnection.send_command(self.__ENCODER_1_COUNT, self.__terminator)
        bites = self.__serialConnection.get_response()

        ticks = int(bites, 16)

        if(ticks > (1 << 16) / 2):
            ticks = -((1 << 16) - ticks)

        if self.__DEBUG:
            print("Getting encoder 1 count.")
            print(ticks)

        # TODO Debug why is this one twice as much?
        return int(ticks / 2)

        # TODO confirm result
        return (self.__serialConnection.get_response())

    def get_encoder_2_count(self):
        self.__serialConnection.send_command(self.__ENCODER_2_COUNT, self.__terminator)
        bites = self.__serialConnection.get_response()

        ticks = int(bites, 16)

        if(ticks > (1 << 16) / 2):
            ticks = -((1 << 16) - ticks)

        if self.__DEBUG:
            print("Getting encoder 2 count.")
            print(ticks)
        return ticks

        # TODO confirm result
        return (self.__serialConnection.get_response())

    def reset_encoder_1_count(self):
        self.__serialConnection.send_command(self.__RESET_ENCODER_1_COUNT)
        if self.__DEBUG:
            print("Resetting encoder 1 count")
            print(self.__serialConnection.get_response())

    def reset_encoder_2_count(self):
        self.__serialConnection.send_command(self.__RESET_ENCODER_2_COUNT)
        if self.__DEBUG:
            print("Resetting encoder 2 count")
            print(self.__serialConnection.get_response())

    def reset_encoders_count(self):
        if self.__DEBUG:
            print("Resetting both encoder counts.")
        self.reset_encoder_1_count()
        self.reset_encoder_2_count()

    def clamp(self, n, smallest, largest):
        return max(smallest, min(n, largest))

    def update(self):
        encoder_1_now = self.get_encoder_1_count()
        encoder_2_now = self.get_encoder_2_count()

        time_delta = time.perf_counter() - self.__then
        encoder_1_delta = encoder_1_now - self.__encoder_1_then
        encoder_2_delta = encoder_2_now - self.__encoder_2_then

        ignore_1 = False
        if abs(encoder_1_delta) > 10:
            ignore_1 = True

        ignore_2 = False
        if abs(encoder_2_delta) > 10:
            ignore_2 = True


        self.__encoder_1_then = encoder_1_now
        self.__encoder_2_then = encoder_2_now
        self.__then += time_delta

        #print("DLT:\t"+str(encoder_1_delta) + "\t" + str(encoder_2_delta))

        encoder_1_speed = encoder_1_delta / time_delta
        encoder_2_speed = encoder_2_delta / time_delta

        #print("SPD:\t"+str(encoder_1_speed) + "\t" + str(encoder_2_speed))

        encoder_1_error = self.__target_speed_0 - encoder_1_speed
        encoder_2_error = self.__target_speed_1 - encoder_2_speed

        #print("ERR:\t"+str(encoder_1_error) + "\t" + str(encoder_2_error))

        encoder_1_ctrl = int(self.clamp(encoder_1_error * self.__KP_1, -1, 1) * 250)
        encoder_2_ctrl = int(self.clamp(encoder_2_error * self.__KP_2, -1, 1) * 250)

        #print("CTL:\t"+str(encoder_1_ctrl) + "\t" + str(encoder_2_ctrl))

        if ignore_1 is False:
            self.__serialConnection.send_command(self.__MOV_1, encoder_1_ctrl, self.__terminator)
            if encoder_1_ctrl > 0:
                self.__serialConnection.send_command(self.__FORWARD_1, self.__terminator)
            else:
                self.__serialConnection.send_command(self.__REVERSE_1, self.__terminator)

        if ignore_2 is False:
            self.__serialConnection.send_command(self.__MOV_2, encoder_2_ctrl, self.__terminator)
            if encoder_2_ctrl > 0:
                self.__serialConnection.send_command(self.__FORWARD_2, self.__terminator)
            else:
                self.__serialConnection.send_command(self.__REVERSE_2, self.__terminator)
