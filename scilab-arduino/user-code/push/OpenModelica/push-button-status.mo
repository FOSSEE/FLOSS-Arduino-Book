model push_button_status "Checking Status of PushButton"
  extends Modelica.Icons.Example;
  import sComm = Arduino.SerialCommunication.Functions;
  import strm = Modelica.Utilities.Streams;
  Integer ok(fixed = false);
  Integer digital_in(fixed = false);
  Integer digital_out(start = 0, fixed = false);
  Integer c_ok(fixed = false);
algorithm
  when initial() then
    ok := sComm.open_serial(1, 0, 115200) "At port 0 with baudrate of 115200";
  end when;
  if ok <> 0 then
    strm.print("Unable to open serial port, please check");
  else
    digital_in := sComm.cmd_digital_in(1, 12);
    if digital_in == 0 then
      digital_out := sComm.cmd_digital_out(1, 9, 0) "This will turn OFF the blue LED";
      strm.print("LOW");
      sComm.delay(200);
    else
      digital_out := sComm.cmd_digital_out(1, 9, 1) "This will turn ON the blue LED";
      strm.print("HIGH");
      sComm.delay(200);
    end if;
  end if;
  //for i in 1:1000 loop
  //end for;
  when terminal() then
    c_ok := sComm.close_serial(1) "To close the connection safely";
  end when;
  //sComm.cmd_arduino_meter(digital_in);
  annotation(experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.01));
end push_button_status;