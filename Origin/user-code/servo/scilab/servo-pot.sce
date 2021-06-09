ok = open_serial(1, 2, 115200) // At port 2 with baud rate of 115200
if ok ~= 0 error('Check the serial port and try again'); end
cmd_servo_attach(1, 1) // Attach the motor to pin 5
for i=1:50              // 5,000 itterations
    val = cmd_analog_in(1, 2)  // Read potntiometer value
    val = floor(val*(180/1023)) // Scale Potentiometer value to 0-180
    cmd_servo_move(1, 1, val) // Command the servo motor
    sleep(500)            // sleep for 500 milliseconds
end
cmd_servo_detach(1, 1)// Detach the motor
close_serial(1)
