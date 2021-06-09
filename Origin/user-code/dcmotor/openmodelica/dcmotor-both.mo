model dcmotor_both "Rotate DC Motor in both directions"
  extends Modelica.Icons.Example;
  import sComm = Arduino.SerialCommunication.Functions;
  import strm = Modelica.Utilities.Streams;
  Integer ok(fixed = false);
  Integer c_ok(fixed = false);
algorithm
  when initial() then
    ok := sComm.open_serial(1, 2, 115200) "COM port is 2 and baud rate is 115200";
    sComm.delay(2000);
    if ok <> 0 then
      strm.print("Unable to open serial port, please check");
    else
      sComm.cmd_dcmotor_setup(1, 3, 1, 9, 10) "Setup DC motor of type 3 (L293D), motor 1, pin 9 and 10";
      sComm.cmd_dcmotor_run(1, 1, 100) "Motor 1 runs at PWM 100";
      sComm.delay(3000) "for 3 seconds";
      sComm.cmd_dcmotor_run(1, 1, -100) "Motor 1 runs at PWM -100 in reverse direction";
      sComm.delay(2000) "for 2 seconds";
      sComm.cmd_dcmotor_release(1, 1) "Motor 1 is released";
    end if;
    c_ok := sComm.close_serial(1) "To close the connection safely";
  end when;
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 10));
end dcmotor_both;
