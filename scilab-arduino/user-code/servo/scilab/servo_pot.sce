// Connect the Arduino at port 2
ok = open_serial(1,2,115200) 

if ok ~= 0 error('Check the serial port and try again');
end

// Attach the motor to pin 9. 1~pin 9, 2~pin 10 
cmd_servo_attach(1,1)

for i=1:40                  //Run for 40 itterations
    p=cmd_analog_in(1,2)    //Read potntiometer value
    p=floor(p*(180/1023))   //Scale Potentiometer value to 0-180
    cmd_servo_move(1,1,p)   //Command the servo motor
    sleep(500)              //sleep for 500 milliseconds
end
close_serial(1);            //To close the connection safely

