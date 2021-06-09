model servo_reverse
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
      strm.print("Check the serial port and try again");
    else
      sComm.cmd_servo_attach(1, 1) "Attach the motor to pin 5. 1 means 5";
      sComm.cmd_servo_move(1, 1, 90) "Move the servo to 90 degree";
      sComm.delay(1000) "be there for one second";
      sComm.cmd_servo_move(1, 1, 45) "Move the servo to 45 degree";
      sComm.delay(1000) "be there for one second";
      sComm.cmd_servo_detach(1, 1) "Detach the motor";
    end if;
    c_ok := sComm.close_serial(1) "To close the connection safely";
  end when;
  annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6, Interval = 5));
end servo_reverse;
