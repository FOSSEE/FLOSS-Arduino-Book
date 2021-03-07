// Connect the Arduino at port 2
ok = open_serial(1,2,115200) 

if ok ~= 0 error('Check the serial port and try again');
end

// Attach the motor to pin 9. 1 means pin 9, 2 means pin 10 
cmd_servo_attach(1,1)
sleep(1000)

cmd_servo_move(1,1,90) // Move the servo to 90 degree
sleep(1000)

cmd_servo_move(1,1,45) // Move the servo to 45 degree
sleep(1000)

cmd_servo_detach(1,1)  // Detach the motor
sleep(1000)

close_serial(1);  //To close the connection safely
