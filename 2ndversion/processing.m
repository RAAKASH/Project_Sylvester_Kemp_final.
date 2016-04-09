function [ A ] = processing( A )
%% Proceesing of rubbish data got after Newton Raphson
%  Converts huge numbers to simple numbers greater than 0 less than 360 degrees 

A = A*180/pi;
[m,~] = size(A);
for i = 1:m
if(A(i,3)<0)
    while(A(i,3)<0)
     A(i,3)=A(i,3)+360;
    end
else
A(i,3) = mod(A(i,3),360);    
end
if(A(i,4)<0)
    while(A(i,4)<0)
     A(i,4)=A(i,4)+360;
    end
else
A(i,4) = mod(A(i,4),360);    
end

end

