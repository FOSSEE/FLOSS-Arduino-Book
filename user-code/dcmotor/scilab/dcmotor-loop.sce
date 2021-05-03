ok = open_serial(1, 2, 115200)//COM port is 2 and baud rate is 115200
if ok ~= 0, error('Serial port is not accesible'); end
cmd_dcmotor_setup(1, 3, 1, 9, 10) // Setup DC motor of type 3 (L293D), motor 1, pins 9 and 10
for i = 1:4
    cmd_dcmotor_run(1, 1, 100)  // Motor 1 runs at PWM 100
    sleep(3000)               // for 3 seconds
    cmd_dcmotor_run(1, 1, 0)    // Halt the motor
    sleep(2000) 	      // for 2 seconds
    cmd_dcmotor_run(1, 1, -100) // Run it at PWM 100 in reverse direction
    sleep(2000)               // for 2 seconds
end
cmd_dcmotor_release(1, 1)      // Motor 1 is released
close_serial(1); 
