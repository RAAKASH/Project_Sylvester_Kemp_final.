function [ b ,theta] = Branch( l,B )
% Function used for finding other branches
% Note :   Here input argument B is in degrees 
% Also program is incomplete . 
B = B*pi/180;
tantheta = -l(2)*sin(B(:,2))./(l(1)-l(2)*cos(B(:,2)));

theta    = atan(tantheta);
theta    = theta*180/pi;
theta    = mod(theta,360);
B = B*180/pi;
if(B(1,3)<theta(1))
b = B;
% b(:,3:4) = b(:,3:4) 2*(-B(:,3:4)+theta);
b(:,4) = b(:,4) -2*(B(:,4)-theta);
b(:,3) = b(:,3)+2*(- b(:,3)+theta);

else
% Fill in the code!!!!!!
% It works for our main config ,but to generally test any config this has to be filled.
b=0;
end

