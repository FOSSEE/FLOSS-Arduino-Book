//
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2011-2011 - DIGITEO - Bruno JOFRET
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
//
//

function [x, y, typ]=ARDUINO_SERVO_WRITE(job, arg1, arg2)
    x=[];
    y=[];
    typ=[];
    select job
     case 'plot' then
// deprecated
     case 'getinputs' then
// deprecater
     case 'getoutputs' then
// deprecated
     case 'getorigin' then
// deprecated
     case 'set' then
      x=arg1;
      graphics=arg1.graphics;
      exprs=graphics.exprs
      model=arg1.model;

      while %t do
          [ok,num_pin,num_arduino,exprs]=scicos_getvalue('Arduino Servo Write parameters',..
                                         [gettext('Servo number (1 or 2)'),gettext('Arduino card number')],list('vec',1,'vec',1), exprs)
          mess=[];

          if ~ok then// Cancel
              break;
          end
          if num_arduino<>1 then
              mess=[mess ;gettext("Only card 1 can be used with this toolbox version ")];
              ok=%f;
          end
          if num_pin < 1 | num_pin>2
              mess=[mess ;_("Servo numbers must be 1 or 2 (on pin 10 and 9)")]
              ok = %f
          end


          if ok then// Everything's ok
              model.rpar=[num_pin,num_arduino];
              graphics.exprs = exprs;
              x.model=model;
              x.graphics = graphics;
              break
          else
              message(mess);
          end

      end
     case 'define' then
      model=scicos_model();
      model.sim=list("ARDUINO_SERVO_WRITE_sim", 5)
      model.blocktype='d';
      model.dep_ut=[%f %f];
      model.in=[1];
      model.evtin=[1]
      model.evtout=[1]
      model.firing=[0;-1]
      Pin=1; num_arduino=1;
      model.rpar=[Pin,num_arduino]; //Default Pin number and Arduino card number
      x=standard_define([2 2],model,[],[]);
      x.graphics.in_implicit=['E'];
      x.graphics.style=["blockWithLabel;verticalLabelPosition=bottom;verticalAlign=top;spacing=-2;displayedLabel=Servo %s<br>on card %s"]
      x.graphics.exprs=[string(Pin),string(num_arduino)];
    end
endfunction
