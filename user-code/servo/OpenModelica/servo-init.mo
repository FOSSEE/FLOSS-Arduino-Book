model servo_init "Rotate Servo Motor "
  extends Modelica.Icons.Example;
  import sComm = Arduino.SerialCommunication.Functions;
  import strm = Modelica.Utilities.Streams;
  Integer ok(fixed = false);
  Integer c_ok(fixed = false);
algorithm
  when initial() then
    ok := sComm.open_serial(1, 2, 115200) "COM port is 2 and baud rate is 115200";
    if ok <> 0 then
      strm.print("Check the serial port and try again");
    else 
      sComm.delay(2000);
      sComm.cmd_servo_attach(1, 1) "To attach the motor to pin 5 of servo1";
      sComm.cmd_servo_move(1, 1, 30) "tell servo to rotate by 30 degrees";
      sComm.delay(1000);
    end if;
    c_ok := sComm.close_serial(1) "To close the connection safely";
  end when;
  sComm.cmd_servo_detach(1, 1);
  annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6, Interval = 5));
end servo_init;
