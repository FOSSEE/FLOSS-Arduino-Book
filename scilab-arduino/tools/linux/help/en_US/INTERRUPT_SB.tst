\name
INTERRUPT_SB

\palette
Arduino

\smalldescription
Used to track a set of events on one or more channels.

\description
This is a read counter that counts the information from absolute position sensors (Hall effect sensor ...).
The block is used to read the rising edges detected on the interruption inputs of the Arduino board. These inputs are capable of stopping the main program during a change of state (edges of a signal) to execute a subroutine. The subroutine in this case is to increment a counter.
Pins 2 and 3 are the only pins of the Arduino Uno that support interrupts. On the Mega board, the pins are 2, 3 and 18 to 21.
Do note that the minimum sampling rate is 8 ms for this block.

\dialogbox
The device offers a menu that allows the declaration of the interrupt pin 2 or 3 on a UNO card (2, 3 or 18 to 21 for the MEGA board) and declaration of any digital pin 2 to 13 for a UNO card (2-53 for the MEGA board).
The card number can not be changed at this time.
\image{INTERRUPT_SB_dialogbox.png}


\example1
The example below shows the use of the block to count the signal of a optical sensor connected to pin 3.
\image{INTERRUPT_exemple.png}

\seealso
ENCODER_SB
