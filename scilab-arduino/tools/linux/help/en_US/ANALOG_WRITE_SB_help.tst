\name
ANALOG_WRITE_SB

\palette
Arduino

\smalldescription
Analog outputs which allow generation of analog voltage on a given port

\description
The analog outputs of the Arduino Uno is available at the pins 3,5,6,9,10 and 11, while on the Mega board, the outputs are on pins 1-13 and 44-46. It is a bit misleading to use the term "analog output", because in order to generate this output while minimizing energy losses, the Arduino uses PWM (Pulse Width Modulation) available on these ports. By varying the duty cycle of the PWM is altered the average voltage across the component connected to this port, which has the effect of having a analog output voltage.
The input port accepts the value from 0 to 255 which is correspoding to the duty cycle of 0 to 100%. In other words, sending 0 to the block will generate 0 V output at the port, 127 generates 2.5V and 255 generates 5V. (the port is 8 bits, so the resolutions of output would be 2^8 =256).
Do note that the minimum sampling rate is 8 ms for this block.

\dialogbox
\image{ANALOG_WRITE_SB_dialogbox.png}
The port number must be 3, 5, 6, 9, 10, 11 for UNO card (PWM ports with symbol ~) and must be 1 to 13 or 44 to 46 for the MEGA board. Using other ports would either cause the output to 0 or 5V according to the value sent.
The card number can not be changed at this time.

\example1
The following example shows the use of the block to control the brightness of a LED by a potentiometer. The LED (in series with a resistor with proper ohmic) is connected to ground (GND) and to the port 10 while potentiometer is connected to the analog input A2. As the analog input is 10 bits while the PWM is bits, it is necessary to add a gain to convert 0 - 1023 to 0 - 255.
\image{ANALOG_WRITE_exemple.png}

\seealso
ANALOG_READ_SB
DIGITAL_READ_SB
DIGITAL_WRITE_SB
