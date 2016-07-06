__authors__ = 'Ryan Owens Zach Anderson'
__Creation_Date__ ='06/25/2016'
__Last_Update__ = '07/05/2016'

import sys
import time

class MotorControl:
    def __init__(self, serialConnection, command_terminator, debug=True):
        self.__serialConnection = serialConnection
        self.__terminator = command_terminator
        self.__MAV = "a"
        self.__MOV_1 = "b"
        self.__MOV_2 = "c"
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
        self.__WAIT_FOR_ECHO = False
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
        self.__left_throttle = 0
        self.__right_throttle = 0
        self.__KP_1 = 1
        self.__KP_2 = 1

        self.__pid_enabled = False


        self.stop()

    def set_direction_Forward(self):
        warnings.warn("deprecated, use move_at_velocity or move_at_percentage", DeprecationWarning)
        if self.__DEBUG:
            print("Setting direction to forward.")
        try:
            response = self.__serialConnection.send_command(self.__FORWARD, self.__terminator)
            if response is True:
                self.__is_stopped = False
                self.__is_moving_forward = True
            return response
        except:
            raise


    def set_direction_Reverse(self):
        warnings.warn("deprecated, use move_at_velocity or move_at_percentage", DeprecationWarning)
        if self.__DEBUG:
            print("Setting direction to reverse.")
        try:
            response = self.__serialConnection.send_command(self.__REVERSE,self.__terminator)
            if response is True:
                self.__is_stopped = False
                self.__is_moving_forward = False
            return response
        except:
            raise

    def set_direction_Left(self):
        warnings.warn("deprecated, use move_at_velocity or move_at_percentage", DeprecationWarning)
        if self.__DEBUG:
            print("Setting direction to left.")
        try:
            response = self.__serialConnection.send_command(self.__LEFT, self.__terminator)
            if response is True:
                self.__is_left = True
            return response
        except:
            raise

    def set_direction_Right(self):
        warnings.warn("deprecated, use move_at_velocity or move_at_percentage", DeprecationWarning)
        if self.__DEBUG:
            print("Setting direction to Right.")
        try:
            response = self.__serialConnection(self.__RIGHT, self.__terminator)
            if response is True:
                self.__is_left = False
            return response
        except:
            raise


    def move_at_velocity(self, velocity):
        self.__is_stopped = False;
        if type(velocity) is tuple:
            self.__target_speed_0 = velocity[0];
            self.__target_speed_1 = velocity[1];
        else:
            self.__target_speed_0 = velocity;
            self.__target_speed_1 = velocity;
        if self.__DEBUG:
            print("Moving at " + str(velocity) + " ticks / second")
        return True


    def move_at_percentage(self, percent):
        self.__is_stopped = False

        if type(percent) is tuple:
            leftSpeed = int(percent[0] * 250)
            rightSpeed = int(percent[1] * 250)
        else:
            leftSpeed = int(percent * 250)
            rightSpeed = int(percent * 250)

        if leftSpeed > 0:
            try:
                if self.__serialConnection.send_command(self.__FORWARD_1, self.__terminator) is False:
                    return False
            except:
                raise
        else:
            try:
                if self.__serialConnection.send_command(self.__REVERSE_1, self.__terminator) is False:
                    return False
            except:
                raise

        try:
            if self.__serialConnection.send_command(self.__MOV_1, abs(leftSpeed), self.__terminator) is False:
                return False
        except:
            raise

        if rightSpeed > 0:
            try:
                if self.__serialConnection.send_command(self.__FORWARD_2, self.__terminator) is False:
                    return False
            except:
                raise
        else:
            try:
                if self.__serialConnection.send_command(self.__REVERSE_2, self.__terminator) is False:
                    return False
            except:
                raise

        try:
            if self.__serialConnection.send_command(self.__MOV_2, abs(rightSpeed), self.__terminator) is False:
                return False
        except:
            raise

        if self.__DEBUG:
            print("Moving at " + str(percent) + " throttle")

        return True


    def stop(self):
        if self.__is_stopped is False:
            try:
                if self.__serialConnection.send_command(self.__STOP, self.__terminator) is True:
                    self.__is_stopped = True
                    self.__speed_0 = 0
                    self.__speed_1 = 0
                    self.__target_speed_0 = 0
                    self.__target_speed_1 = 0
                    if self.__DEBUG:
                        print("Stopping")
                    return True
                else:
                    return False
            except:
                raise
        else:
            if self.__DEBUG:
                print("System is already stopped, ignoring command.")

    def start_line_following(direction):
        pass

    def stop_line_following():
        pass

    def get_velocity(self):
        warnings.warn("deprecated, no longer supported by PSoC", DeprecationWarning)
        if self.__is_stopped:
            return 0.0;
        else:
            try:
                response = self.__serialConnection.send_command(self.__GETV, self.__terminator, check_result = False)
            except:
                raise
            if self.__DEBUG:
                print("Getting current velocity.")
            # TODO confirm the result should be a double
            return float(response)

    # TODO Cache for a very short amount of time
    def get_encoder_1_count(self):
        try:
            bites = self.__serialConnection.send_command(self.__ENCODER_1_COUNT, self.__terminator, check_result = False)
            if bites is False:
                return False
        except:
            raise
        ticks = int(bites, 16)

        if(ticks > (1 << 16) / 2):
            ticks = -((1 << 16) - ticks)

        if self.__DEBUG:
            print("Getting encoder 1 count.")
            print(ticks)

        # TODO Debug why is this one twice as much?
        return int(ticks)

    # TODO Cache for a very short amount of time
    def get_encoder_2_count(self):
        try:
            bites = self.__serialConnection.send_command(self.__ENCODER_2_COUNT, self.__terminator, check_result = False)
        except:
            raise

        ticks = int(bites, 16)

        if(ticks > (1 << 16) / 2):
            ticks = -((1 << 16) - ticks)

        if self.__DEBUG:
            print("Getting encoder 2 count.")
            print(ticks)
        return ticks

    def reset_encoder_1_count(self):
        try:
            if self.__serialConnection.send_command(self.__RESET_ENCODER_1_COUNT) is False:
                return False
        except:
            raise
        if self.__DEBUG:
            print("Resetting encoder 1 count")
        return True

    def reset_encoder_2_count(self):
        try:
            if self.__serialConnection.send_command(self.__RESET_ENCODER_2_COUNT) is False:
                return False
        except:
            raise
        if self.__DEBUG:
            print("Resetting encoder 2 count")
        return True

    def reset_encoders_count(self):
        if self.__DEBUG:
            print("Resetting both encoder counts.")
        try:
            return self.reset_encoder_1_count() and self.reset_encoder_2_count()
        except:
            raise

    def clamp(self, n, smallest, largest):
        return max(smallest, min(n, largest))

    def enable(self):
        self.__enable_pid = True

    def disable(self):
        self.__enable_pid = False

    def get_left_velcity(self):
        return self.__left_speed

    def get_right_velocity(self):
        return self.__right_speed

    def update(self):
        try:
            encoder_1_now = self.get_encoder_1_count()
        except:
            ignore_1 = True

        try:
            encoder_2_now = self.get_encoder_2_count()
        except:
            ignore_2 = True

        time_delta = time.perf_counter() - self.__then
        encoder_1_delta = encoder_1_now - self.__encoder_1_then
        encoder_2_delta = encoder_2_now - self.__encoder_2_then

        self.__encoder_1_then = encoder_1_now
        self.__encoder_2_then = encoder_2_now
        self.__then += time_delta

        # Speed unit is ticks / second
        encoder_1_speed = encoder_1_delta / time_delta
        encoder_2_speed = encoder_2_delta / time_delta

        ignore_1 = False
        if abs(encoder_1_delta) > 20:
            ignore_1 = True
        else:
            self.__left_speed = encoder_1_speed

        ignore_2 = False
        if abs(encoder_2_delta) > 20:
            ignore_2 = True
        else:
            self.__left_speed = encoder_2_speed

        if self.__enable_pid is True:
            encoder_1_error = self.__target_speed_0 - encoder_1_speed
            encoder_2_error = self.__target_speed_1 - encoder_2_speed

            if ignore_1 is False:
                self.__left_throttle += int((encoder_1_error * self.__KP_1))
                try:
                    if self.__serialConnection.send_command(self.__MOV_1, self.__left_throttle, self.__terminator) is False:
                        return False
                except:
                    raise

                if self.__left_throttle > 0:
                    try:
                        if self.__serialConnection.send_command(self.__FORWARD_1, self.__terminator) is False:
                            return False
                    except:
                        raise
                else:
                    try:
                        if self.__serialConnection.send_command(self.__REVERSE_1, self.__terminator) is False:
                            return False
                    except:
                        raise

            if ignore_2 is False:
                self.__right_throttle += int((encoder_2_error * self.__KP_2))
                try:
                    if self.__serialConnection.send_command(self.__MOV_2, self.__right_throttle, self.__terminator) is False:
                        return False
                except:
                    raise
                if self.__right_throttle > 0:
                    try:
                        if self.__serialConnection.send_command(self.__FORWARD_2, self.__terminator) is False:
                            return False
                    except:
                        raise
                else:
                    try:
                        if self.__serialConnection.send_command(self.__REVERSE_2, self.__terminator) is False:
                            return False
                    except:
                        raise

        if self.__DEBUG is False:
            print("\nUpdate throttle, delta t = " + str(time_delta))
            print("DLT:\t"+str(encoder_1_delta) + "\t" + str(encoder_2_delta))
            print("SPD:\t"+str(encoder_1_speed) + "\t" + str(encoder_2_speed))
            print("ERR:\t"+str(encoder_1_error) + "\t" + str(encoder_2_error))
            print("THR:\t"+str(self.__left_throttle) + "\t" + str(self.__right_throttle))
