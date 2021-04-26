//
// This file is part of Arduino toolbox
// Copyright (C) 2012-2012 - DEMOSCIENCES - Alain CAIGNOT
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
//
//
function res=open_serial(nHandle, nPort,baudrate)
// Command to initialize the serial port which is connected to Arduino
//
// Calling Sequence
//     res=open_serial(nHandle, nPort,baudrate)
//
// Parameters
//     nHandle : Board number, reserved for future use. For this version, any number would do
//     nPort : Com port in which the Arduino is connected to
//     baudrate : baudrate for the serial comminication
//     res : 0 if the connection is successful, else the connection fail
//  
// Description
//     To connect to the Arduino board. To check the port number, do to the device manager or check it from the Arduino software
//  
// Examples
//    ok = open_serial(1,9,115200) 
//    close_serial(1)
//
// See also
//    close_serial
//    
// Authors
//     Bruno JOFRET

    res=call("open_serial",nHandle,1,"i",nPort,2,"i",baudrate,3,"i","out",[1,1],4,"i")
endfunction
