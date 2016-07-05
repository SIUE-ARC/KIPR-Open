__author__ = 'Ryan Owens'
__Creation_Date__ = '11/02/2015'
__Last_Update__ = '07/04/2016'

import sys
import serial
import time

# try:
#     import RPi.GPIO as GPIO
# except ImportError as e:
#     print(e)
#     sys.exit(1)

class UnknownResult(IOError):
    def __init__(self, message):
        super().__init__(message)

class SerialCommunication:
    constant_communication = False

    def __init__(self, port, baud_rate, should_expect_a_result = True):
        self.__port = port
        self.__baud_rate = baud_rate
        self.__expecting_response = False
        self.__expecting_acknowledge = False
        self.__wait_time_in_seconds = 0.0005
        self.__timeout_for_response = 0.0005
        self.__wait_for_resp = should_expect_a_result
        self._ACK = "ack"
        self._NACK = "fu1337"

        try:
            self.__connection = serial.Serial(port, baud_rate, timeout=1)
        except serial.SerialException as e:
            print(e)
            exit(1)

        self.__character_code_list = []
        self.__parameter_list = []
        self.__response_list = []

        if not self.__connection.isOpen():
            print("No serial self.connection")
            # TODO what to do if no self.connection is created
            sys.exit(1)
        else:
            self.flush()
            print("Connection Established on:" + self.__port + " At " + str(self.__baud_rate))

    def send_command(self, character_code, parameter1=None, parameter2=None, check_result = True):
        # TODO put send code in separate thread
        # TODO should all of the try/catches be used? They are expensive.
        try:
            self.__connection.write(str(character_code).encode())
            # self.character_code_list.append(str(character_code))
        except serial.SerialTimeoutException as e:
            print(e)

        if parameter1 is not None:
            try:
                self.__connection.write(str(parameter1).encode())
                self.__parameter_list.append(str(parameter1))
            except serial.SerialTimeoutException as e:
                print(e)
                return 1

        if parameter2 is not None:
            try:
                self.__connection.write(str(parameter2).encode())
                self.__parameter_list.append(str(parameter2))
            except serial.SerialTimeoutException as e:
                print(e)
        time.sleep(self.__wait_time_in_seconds)

        if self.__wait_for_resp is True:
            try:
                return self.get_response(check_result)
            except:
                raise

    def start_constant_communication(self):
        # TODO process for constant listening on separate thread
        self.constant_communication = True

    def get_response(self, check_result = True):
        # TODO make a private get response thread to update the queue
        # get_response should then pop the last item on the queue
        # TODO should the __expecting_reponse always be true to receive a respons?
        start_time = time.perf_counter()
        curr_time = start_time
        while (self.__connection.inWaiting() == 0) and (curr_time - start_time < self.__timeout_for_response):
            curr_time = time.perf_counter()
#            print("Waiting for response")
        if self.__connection.inWaiting() == 0:
            raise serial.SerialException("Timeout on reading from port " + str(self.__port))
        else:
            response = self.__connection.read(self.__connection.inWaiting())
            self.__response_list.append(response)
            self.__expecting_response = False
            self.__expecting_acknowledge = False
            if check_result is True:
                if self._ACK in response:
                    return True
                elif self._NACK in response:
                    return False
                else:
                    raise UnknownResult("Result is nether an ACK or NACK")
            else:
                return response

    def wait_for_response(self):
        while self.__connection.inWaiting() == 0:
            time.sleep(0.0005)
        return self.__connection.read(self.__connection.inWaiting())

    # TODO get_last methods should be replaced
    def get_last_response(self):
        return self.__response_list[-1]

    def get_last_character_code(self):
        return self.__character_code_list[-1]

    def get_last_parameter(self):
        return self.__parameter_list[-1]

    # TODO implement try/catch and finally clause
    def close_connection(self):
        print("Closing Port")
        self.flush()
        self.__connection.close()

    def flush(self):
        self.__connection.flushInput()
        self.__connection.flushOutput()
        self.__connection.flush()

    def get_connection_info(self):
        return self.__connection.getByteSize
