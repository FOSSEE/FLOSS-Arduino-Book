model led_push_button "Conrolling LED with PushButton"
  extends Modelica.Icons.Example;
  import sComm = Arduino.SerialCommunication.Functions;
  import strm = Modelica.Utilities.Streams;
  Integer ok(fixed = false);
  Integer digital_in(fixed = false);
  Integer digital_out(fixed = false);
  Integer c_ok(fixed = false);
algorithm
  when initial() then
    ok := sComm.open_serial(1, 2, 115200) "At port 2 with baudrate of 115200";
  end when;
  if ok <> 0 then
    strm.print("Unable to open serial port, please check");
  else
    digital_in := sComm.cmd_digital_in(1, 12) "Read from digital pin 12";
    if digital_in == 0 then
      strm.print("LOW");
      digital_out := sComm.cmd_digital_out(1, 9, 0) "This will turn OFF the blue LED";
      sComm.delay(200);
    else
      strm.print("HIGH");
      digital_out := sComm.cmd_digital_out(1, 9, 1) "This will turn ON the blue LED";
      sComm.delay(200);
    end if;
  end if;
  //for i in 1:1000 loop
  //end for;
  //strm.print(String(time));
  when terminal() then
    c_ok := sComm.close_serial(1) "To close the connection safely";
  end when;
  annotation(experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.01));
end led_push_button;
