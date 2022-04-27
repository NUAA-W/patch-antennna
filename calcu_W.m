function W = calcu_W(f,E_r,c)
%CALCU_W Summary of this function goes here
%   Detailed explanation goes here

W = roundn(c/(2*f)*sqrt ( 2/(E_r+1) ),-5);

end

