
//voltage
function p=read_val(addr_byte)
h=open_serial(1,2,9600)

//for x=1:5
    //arr=[ascii(01) ascii(03) ascii(15) ascii(86) ascii(00) ascii(02) ascii(39) ascii(15)];
    //arr1=string(arr)
    if(addr_byte==86)
    array1=ascii(01)+ ascii(03) + ascii(15) + ascii(86) + ascii(00) + ascii(02) + ascii(39) + ascii(15)
    disp("Voltage(in V)=")
    elseif(addr_byte==88)
    array1=ascii(01) + ascii(03) + ascii(15) + ascii(88) + ascii(00) + ascii(02) + ascii(70) + ascii(204);
    disp("Current(in A)=")
    elseif(addr_byte==78)
     array1=ascii(01) + ascii(03) + ascii(15) + ascii(78) + ascii(00) + ascii(02) + ascii(167) + ascii(08);
     disp("Active Power(in W)=")
     end
    write_serial(1,array1,8);
  
buf=read_serial(1,11)

//sleep(100)
//end


b1=0;b2=0;b3=0;b4=0;
myresult=ascii(buf)
a1=myresult(5); if(a1<16)  then   b1=1; end;         a1=dec2hex(a1);          if(b1) then a1= '0'+string(a1); end;
a2=myresult(6);if(a2<16)  then   b2=1; end ;          a2=(dec2hex(a2));        if(b2) then a2= '0'+string(a2); end;
a3=myresult(7);if(a3<16)  then   b3=1; end;          a3=(dec2hex(a3));        if(b3) then a3= '0'+string(a3); end;
a4=myresult(8);if(a4<16)  then   b4=1; end;          a4=(dec2hex(a4));        if(b4) then a4= '0'+string(a4); end;
a5=[a3,a4,a1,a2];
a6=strcat(a5)
//a6=a2+256*a1+256*256*a4+256*256*256*a3
//a7=hex2dec(a6)
//disp(a5)

close_serial(1)
//
p=ieeesingle2num(a6)

disp(p)
//
endfunction
