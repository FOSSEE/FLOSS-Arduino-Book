ok = open_serial(1, 2, 115200); // At port 2 with baudrate of 115200
if ok ~= 0 error('Check the serial port and try again'); end
angle = 20;                      // Angle by which it has to move
for i = 0:10
   cmd_servo_attach(1, 1)        // Attach motor to pin 5. 1 means pin 9.
   cmd_servo_move(1, 1, angle*i) // tell servo to rotate by 20 degrees
   sleep(1000)                 // waits for a sec 
end
cmd_servo_detach(1, 1)          // Detach the motor
close_serial(1);               //To close the connection safely
