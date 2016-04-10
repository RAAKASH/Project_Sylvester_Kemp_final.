function [ k1,k2 ] = Kempepostpro( I )
%% This function segregates the mechanism into branches
% Input: I - Indices for which the solution exists
% Output:  k1 -Indices of Branch1 
%          k2 -Indices of Branch1  
%% Main Program
for i= 1:(length(I)-1)
   
    if( abs(I(i)-I(i+1))>1.1)
    break;    
    end
   
end
if(i<(length(I)-1))
k1 = I(1:i);
k2 = I(i+1:end);
else
k1 = I(1:i+1);
k2=0;
end
end

