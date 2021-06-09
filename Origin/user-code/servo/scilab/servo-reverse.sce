ok = open_serial(1, 2, 115200)  // Connect to Arduino at port 2 
if ok ~= 0 error('Check the serial port and try again'); end
cmd_servo_attach(1, 1)         // Attach the motor to pin 5. 1 means 9
cmd_servo_move(1, 1, 90)        // Move the servo to 90 degree
sleep(1000) // be there for one second
cmd_servo_move(1, 1, 45)        // Move the servo to 45 degree
sleep(1000)      // be there for one second
cmd_servo_detach(1, 1)          // Detach the motor
close_serial(1)               // To close the connection safely 
