model servo_pot "Control Servo Motor using Potentiometer"
  extends Modelica.Icons.Example;
  import sComm = Arduino.SerialCommunication.Functions;
  import strm = Modelica.Utilities.Streams;
  Integer ok(fixed = false);
  Integer c_ok(fixed = false);
  Integer val(fixed = false);
algorithm
  when initial() then
    ok := sComm.open_serial(1, 2, 115200) "COM port is 2 and baud rate is 115200";
    sComm.delay(2000);
    if ok <> 0 then
      strm.print("Check the serial port and try again");
    else
      sComm.cmd_servo_attach(1, 1) "Attach the motor to pin 5";
      sComm.delay(2000);
      for i in 1:50 loop
        val := sComm.cmd_analog_in(1, 2) "Read potentiometer value";
        val := integer(val * 180 / 1023) "Scale Potentiometer value to 0-180";
        sComm.cmd_servo_move(1, 1, val) "Command the servo motor";
        sComm.delay(500) "sleep for 500 milliseconds";
      end for;
      sComm.cmd_servo_detach(1, 1) "Detach the motor";
    end if;
    c_ok := sComm.close_serial(1) "To close the connection safely";
  end when;
//        strm.print(String(integer(analog_in * 180 / 1023)));
//    analog_in := sComm.math_floor(analog_in * (180 / 1023)) "Scale Potentiometer value to 0-180";
//strm.print(String(analog_in));
  annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6, Interval = 5));
end servo_pot;
