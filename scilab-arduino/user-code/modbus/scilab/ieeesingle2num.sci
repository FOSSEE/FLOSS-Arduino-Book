function y = ieeesingle2num(hexa)

// This converts an integer form of IEEE single
// precision format to the corresponding
// value. The argument x must be a 'double'
// positive integer less than 2^32. For example,
// 1078530011 ==> 40490FDB ==> 3.14159274101257
// RAS - 9/20/06

//x=1078530011
//hexa='4368b333'
x=hex2dec(hexa);
k = 2^31   //pow2(31);
s = (x >= k);
if s, x = x - k; end
//t = pow2(x,-23);
t = x.*2.^-23
e = floor(t);
f = t - e;
if e == 255
 if f == 0, y = %inf; else, y = %nan; end
elseif e > 0
// y = pow2(1+f,e-127);
 y = (1+f).*2.^(e-127);
 
else
// y = pow2(f,-126);
 y = f.*2.^-126;
end
if s, y = -y; end

//end
