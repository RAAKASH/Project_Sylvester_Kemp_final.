function [ d ,L] = Grashoff( l )
%% Finds whether a mechanism is a grashoff mechaniism or not
%   Also returns the crank rocker configuration.

%%   
 if ( 2*(max(l)+min(l)) < sum(sum(l)))
 
     d =1;
     i = find(l==min(l));
     j = i-2;
     k = [1,2,3,4] -j; 
     g = find(k<=0);
     k(g) = (k(g))+4;
        
     for i=1:4
     L(k(i)) = l(i);
     end
     
 else
     d = 0;
     L=l;
 end




end

