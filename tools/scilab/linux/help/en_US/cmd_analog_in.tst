\name
cmd_analog_in

\module
Arduino

\smalldescription
Analog ports of an Arduino board which allow the acquisition of an analog input

\description
Arduino UNO board has 6 analog input ports (A0 to A5), the Arduino Mega board has 16 analog input ports (A0 to A15). The 10 bits channels convert the analog input from 0 to 5 volts, to a digital value between 0 and 1023.
Do note that the minimum sampling rate is 8 ms for this block.

\callingsequences
The port number of 0-5 must be specified for the UNO card, 0-15 for a MEGA board.
The card number can not be changed at this time.
There would be no verification routine for the setting, please refer to the specification of your Arduino board to put a correct value.

\example1
The following example shows the use of the block in connecting with an angular potentiometer which signal pin is connected to port 2 of Arduino board. The other two pins of the potentiometer are connected to ground (GND) and the 5 Volt the card directly.

\seealso
ANALOG_WRITE_SB
DIGITAL_READ_SB
DIGITAL_WRITE_SB
