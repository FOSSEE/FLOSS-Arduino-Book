ok = open_serial(1,4,115200)   //COM port is 4 and baud rate is 115200
cmd_dcmotor_setup(1,3,1,10,11) // Setup DC motor of type 3 (L293D), motor 1, pin 9 and 10
cmd_dcmotor_run(1,1,100)       // Motor 1 runs at PWM 100
sleep(3000)                    // for 3 seconds
cmd_dcmotor_run(1,1,-100)      // Motor 1 runs at PWM -100 in reverse
direction 
sleep(2000)                    // for 2 seconds
cmd_dcmotor_release(1,1)       // Motor 1 is released
close_serial(1)
