model push_button_status "Checking Status of PushButton"
  extends Modelica.Icons.Example;
  import sComm = Arduino.SerialCommunication.Functions;
  import strm = Modelica.Utilities.Streams;
  Integer ok(fixed = false);
  Integer val(fixed = false);
  Integer c_ok(fixed = false);
algorithm
  when initial() then
    ok := sComm.open_serial(1, 2, 115200) "At port 2 with baudrate of 115200";
    sComm.delay(2000);
  end when;
  if ok <> 0 then
    strm.print("Unable to open serial port, please check");
  else
    val := sComm.cmd_digital_in(1, 12);
    if val == 0 then
      strm.print("0");
      sComm.delay(200);
    else
      strm.print("1");
      sComm.delay(200);
    end if;
  end if;
//for i in 1:1000 loop
//end for;
  when terminal() then
    c_ok := sComm.close_serial(1) "To close the connection safely";
  end when;
//sComm.cmd_arduino_meter(digital_in);
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.1));
end push_button_status;
