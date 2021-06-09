\name
DIGITAL_READ_SB

\palette
Arduino

\smalldescription
Allows to receive a logical value 0 or 1 on a given port.

\description
The Arduino board has a set of logical ports (digital) that are used for writing or reading data from a component.
To map a UNO, ports 2-13 are available (0 and 1 are used for serial transmission). For MEGA board, ports 2-53 are available. The port takes the low logic level (0) or logic high (1) which corresponds to the reference voltage.
Do note that the minimum sampling rate is 8 ms for this block.

\dialogbox
\image{DIGITAL_READ_SB_dialogbox.png}
The digital port number is between 2 and 53, chosen based on his Arduino.
The card number can not be changed at this time.

\example1
The example below shows the use of the block in the case of an assembly consisting of a switch which is connected to a digital pin 7 and a LED which connected to digital port 10. Pressing the button causes the LED to light up.
\image{DIGITAL_exemple.png}

\seealso
ANALOG_READ_SB
ANALOG_WRITE_SB
DIGITAL_WRITE_SB
