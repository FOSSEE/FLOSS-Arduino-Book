ok = open_serial(1, 2, 115200) // At port 2 with baud rate of 115200
if ok ~= 0 error('Check the serial port and try again'); end
cmd_servo_attach(1, 1)  // To attach the motor to pin 5
cmd_servo_move(1, 1, 30) // tell servo to rotate by 30 degrees
sleep(1000)
cmd_servo_detach(1, 1)          // Detach the motor
close_serial(1)
