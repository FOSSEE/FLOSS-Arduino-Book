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

function [x, y, typ]=ARDUINO_SETUP(job, arg1, arg2)
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
          [ok,num_arduino,port_com,exprs]=scicos_getvalue('Arduino Setup parameters',..
                                                        [gettext('Identifier of Arduino card'),gettext('Serial com port number')],                                                        list('vec',1,'vec',1), ..
                                                        exprs)
          mess=[];

          if ~ok then// Cancel
              break;
          end
          
          if num_arduino<>1 then
              mess=[gettext("Only card 1 can be used with this toolbox version ")];
              ok=%f;
          end

          if port_com>9 | port_com<2 then
              mess=[gettext("Port com must not be greater than 9. Change in the pannel configuration / Port com ")];
              ok=%f;
          end 
          
          if ok then// Everything's ok
              model.rpar=[num_arduino,port_com];
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
      model.sim=list("ARDUINO_SETUP", 99)
      model.blocktype='c';
      model.dep_ut=[%f %f];
      model.in=[];
      num_arduino=1;
      port_com=5;
      model.rpar=[num_arduino,port_com]; //Digital Output number
      x=standard_define([2 2],model,[],[]);
      x.graphics.in_implicit=[];
      x.graphics.style=["blockWithLabel;verticalLabelPosition=bottom;verticalAlign=top;align=center;spacing=-3;displayedLabel=Card %s<br>on com %s"]
      x.graphics.exprs=[string(num_arduino),string(port_com)];
    end
endfunction
