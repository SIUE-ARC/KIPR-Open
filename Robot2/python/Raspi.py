__authors__ = 'Ryan Owens'
__Creation_Date__ = '07/03/2016'
__Last_Update__ = '07/03/2016

try:
    import RPi.GPIO as GPIO
except RuntimeError:
    print("Error importing RPi.GPIO!  This is probably because you need superuser privileges.  You can achieve this by using 'sudo' to run your script")

class Raspi:
    def __init__(self, debug = True):
        self.__HIGH = GPIO.HIGH
        self.__LOW = GPIO.LOW
        self.__IN = GPIO.IN
        self.__OUT = GPIO.OUT
        self.__mode_set = []
        self.__output_pins = []
        self.__input_pins = []
        self.__DEBUG = debug
        for i in range(1, 26):
            # If we change a pin to output/input don't allow it to be changed again
            self.__mode_set[i] = False

        GPIO.setmode(GPIO.BOARD) # So we can use normal pin numbers
        GPIO.setwarnings(False) # no warnings about output pin modes

    def set_pin_to_output(self, pin):
        if 1 < pin < 26:
            if self.__mode_set[pin] is False:
                self.__mode_set[pin] = True
                self.__output_pins.append(pin)
                GPIO.setup(pin, self.__OUT)
            elif self.__DEBUG is True:
                print("Unable to set " +  str(pin) + " to output, it has already been set")
        elif self.__DEBUG is True:
            print(str(pin) + " is not a valid pin")

    def set_pin_to_input(self, pin):
        if 1 < pin < 26:
            if self.__mode_set[pin] is False:
                self.__mode_set[pin] = True
                self.__input_pins.append(pin)
                GPIO.setup(pin, self.__IN)
            elif self.__DEBUG is True:
                print("Unable to set " +  str(pin) + " to input, it has already been set")
        elif self.__DEBUG is True:
            print(str(pin) + " is not a valid pin")

    def set_pin_to_high(self, pin):
        if pin in self.__output_pins:
            GPIO.output(pin, self.__HIGH)
        elif:
            print("Pin is not in the list of output pins.")

    def set_pin_to_low(self, pin):
        if pin in self.__output_pins:
            GPIO.output(pin, self.__LOW)
        elif:
            print("Pin is not in the list of output pins.")

    def get_pin_input(self, pin):
        if pin in self.__input_pins:
            return GPIO.input(pin)
        elif:
            print("Pin is not in the list of input pins.")

    def raspi_info(self):
        return GPIO.RPI_INFO

    def raspi_version(self):
        return GPIO.VERSION
