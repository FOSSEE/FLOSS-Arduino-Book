#!/bin/bash
clear
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 port baudrate" >&2
  exit 1
fi

re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then
   echo "error: $1 -> Not a number" >&2; exit 1
fi

if ! [[ $2 =~ $re ]] ; then
   echo "error: $2-> Not a number" >&2; exit 1
fi

b_rate=$2

present=`pwd`
unamestr=`uname`

if [[ "$unamestr" == 'Linux' ]]; then
	mdd_path=($(locate Modelica_DeviceDrivers/Modelica_DeviceDrivers/Resources/Include))
	om_path=($(locate /usr/include/omc/c))
	port="/dev/ttyACM$1"
	omc --simCodeTarget=ExperimentalEmbeddedC runMDD_dcmotor_clock.mos
	if [ $? -ne 0 ]; then
		exit 1
	fi
else
	cd c:	
	om_path=($(dir -d OpenModelica*/include/omc/c/))
	path_to_om="C:$om_path"
	cd f:
	mdd_path=($(dir -d */Modelica_DeviceDrivers/Modelica_DeviceDrivers/Resources/Include/))
	if [ $? -eq 0 ]; then
		path_to_mdd="F:/$mdd_path"
	else
		exit 1
	fi
	
	port="COM$1"
	cd $present
	omc --simCodeTarget=ExperimentalEmbeddedC run_dcmotor_clock.mos
	if [ $? -ne 0 ]; then
		exit 1
	fi
fi

avr-gcc -Os -std=c11 -ffunction-sections -fdata-sections -mmcu=atmega328p -DF_CPU=16000000UL -Wl,--gc-sections dcmotor_clock_main.c -o dcmotor_clock -I${mdd_path[0]} -I${path_to_om} -I${path_to_mdd} -I${om_path[0]}  
if [ $? -ne 0 ]; then
	exit 1
fi
avr-objcopy -O ihex -R .eeprom dcmotor_clock dcmotor_clock.hex
if [ $? -ne 0 ]; then
	exit 1
fi 
avrdude -F -V -c arduino -p ATMEGA328P -P $port -b $b_rate -U flash:w:dcmotor_clock.hex
if [ $? -ne 0 ]; then
	exit 1
fi