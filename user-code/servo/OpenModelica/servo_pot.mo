model servo_pot "Control Servo Motor using Potentiometer"
  extends Modelica.Icons.Example;
  import sComm = Arduino.SerialCommunication.Functions;
  import strm = Modelica.Utilities.Streams;
  Integer ok(fixed = false);
  Integer c_ok(fixed = false);
  Integer analog_in(fixed = false);
algorithm
  when initial() then
    ok := sComm.open_serial(1, 0, 115200) "COM port is 0 and baud rate is 115200";
    if ok <> 0 then
      strm.print("Check the serial port and try again");
    else
      sComm.delay(2000);
      sComm.cmd_servo_attach(1, 1) "Attach the motor to pin 9";
      sComm.delay(2000);
      for i in 1:5000 loop
        analog_in := sComm.cmd_analog_in(1, 2) "Read potentiometer value";
        analog_in := sComm.math_floor(analog_in * (180 / 1023)) "Scale Potentiometer value to 0-180";
        sComm.cmd_servo_move(1, 1, analog_in) "Command the servo motor";
        sComm.delay(1000) "sleep for 500 milliseconds";
        strm.print("Potentiometer Reading at time" + String(time) + " : " + String(analog_in));
      end for;
    end if;
    sComm.cmd_servo_detach(1, 1) "Detach the motor";
    sComm.delay(5000);
    c_ok := sComm.close_serial(1) "To close the connection safely";
  end when;
  //5,000 itterations
  annotation(experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6, Interval = 5));
end servo_pot;