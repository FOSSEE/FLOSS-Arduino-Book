model servo_loop "Rotate servo motor by 20 degrees 10 times"
  extends Modelica.Icons.Example;
  import sComm = Arduino.SerialCommunication.Functions;
  import strm = Modelica.Utilities.Streams;
  Integer ok(fixed = false);
  Integer c_ok(fixed = false);
  Integer angle(fixed = true);
algorithm
  when initial() then
    ok := sComm.open_serial(1, 0, 115200) "COM port is 0 and baud rate is 115200";
    if ok <> 0 then
      strm.print("Check the serial port and try again");
    else
      sComm.delay(2000);
      sComm.cmd_servo_attach(1, 1) "Attach motor to pin 9. 1 means pin 9.";
      sComm.delay(2000);
      angle := 20 "Angle by which it has to move";
      for i in 1:10 loop
        sComm.cmd_servo_move(1, 1, angle * i) "tell servo to rotate by 20 degrees";
        sComm.delay(1000) "waits for a sec";
      end for;
      sComm.cmd_servo_detach(1, 1) "Detach the motor";
    end if;
    c_ok := sComm.close_serial(1) "To close the connection safely";
  end when;
  annotation(experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6, Interval = 5));
end servo_loop;