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
function res=close_serial(nHandle)
// Command to close the serial port which is connected to Arduino
//
// Calling Sequence
//     res=close_serial(nHandle)
//
// Parameters
//     nHandle : Board number, reserved for future use. For this version, any number would do
//     res : 0 if the connection is successful, else the connection fail
//  
// Description
//     It is important to close the serial port after use, else the port would be busy and restart of Scilab might required to connect to it again.
//  
// Examples
//    ok = open_serial(1,9,115200) 
//    close_serial(1)
//
// See also
//    open_serial
//    
// Authors
//     Bruno JOFRET    
//
    res=call("close_serial",nHandle,1,"i","out",[1,1],2,"i")
endfunction

