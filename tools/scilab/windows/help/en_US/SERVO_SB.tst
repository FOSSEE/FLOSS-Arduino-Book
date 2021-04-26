\name
SERVO_WRITE_SB

\palette
Arduino

\smalldescription
Drive a servomotor by sending command of the angle from 0 to 180°

\description
A servomotor is an  rotary actuator consist of an electric motor, gears, a potentiometer and an analogue or digital electronics for control. The servomotor usualy used for a position control application (or speed for continuous rotation servos). 
The user must give the command of the position setpoint or desired speed. This command is sent to the actuator in pulses spaced by 10 to 20 ms. The coding of these pulses is made such that a pulse of 1.5 ms corresponding to the centered position (rest), a pulse of 1 ms corresponds to an angle of 90° in the anticlockwise direction, and a pulse 2 ms corresponds to an angle of 90° clockwise. All other pulse widths give intermediate values​​. 
A servomotor for continuous rotation, the pulse width control the rotational speed and the direction. 
It is recommended to use a voltage regulator to power the servomotor instead of using the Arduino board power.
For simplicity, the block takes an input commnad in degrees from 0 to 180. 
Two actuators can be controlled with this toolbox. (modified version of 3 motors available)

Do note that the sampling rate is at least 10 ms for this block.

\dialogbox
\image{SERVO_SB_dialogbox.png}
The block is used to set the number of servomotor to be driven. Servo 1 corresponds to port 9 on Arduino and Servo 2 corresponds to port 10 on Arduino.
The card number can not be changed at this time.

\example1
The example below shows the use of the servomotor block which position is controlled by the potentiometer at analog port 0 .
A gain block is used to convert the 10 bits analog input signal from the potentiometer to the range of 0 to 180 to which specify the desired position of the servomotor.
\image{SERVO_SB_exemple.png}

\seealso
DCMOTOR_SB
