from serialCommunication import BaseSerial


def move_at_velocity(serial, speed):
    serial.send_command('a' + str(speed))

def move(serial, percentage):
    serial.send_command('b' + str(percentage))


def set_servo_position(serial, servo_num, position):
    if servo_num == 0:
        serial.send_command('d' + str(position))
    else:
        serial.send_command('e' + str(position))


def turn_off_servo(serial, servo_num):
    if servo_num == 0:
        serial.send_command('f')
    else:
        serial.send_command('g')


def reset_encoder_counts(serial, encoder_num):
    if encoder_num == 0:
        serial.send_command('j')
    else:
        serial.send_command('k')


def stop(serial):
    serial.send_command('l')


def forward(serial):
    serial.send_command('m')


def reverse(serial):
    serial.send_command('n')


def turn_left(serial):
    serial.send_command('o')


def turn_right(serial):
    serial.send_command('p')


port = "/dev/ttyUSB0"
baud_rate = 115200

serial_connection = BaseSerial(port=port, baud_rate=baud_rate)
#print(serial_connection.get_response())
print("Hello World")
forward(serial_connection)
move_at_velocity(serial_connection, 5)
#print(serial_connection.get_response())

