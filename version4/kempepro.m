function [a,Y,I ]= kempepro( A,y )
%% Gives final range of values of straight line mecahnism data.
%  kempepro - 'Sylvester Kempe Processing'.
%  This functions is used for filtering the data got from Datacompiler2.m function, that fits into the
%  straight line mechanism .
%%   ************API***********
%  A - Output got from Datacompiler2
%  y - Processsed variables.

%% Variable Initializaton.
j=0;
[m,~] = size(A);
a(1,1:4)=0;
Y(1)=0;
I(1)=0;
%% Program
for i=1:m-1
   
    if(abs(y(i)-y(i+1))<10^-6)
    j=j+1;  
   Y(j)      = y(i);
   Y(j+1)    = y(i+1);
   a(j,:)    = A(i,:);
   a(j+1,:)  = A(i+1,:);
   I(j)      = i;
   I(j+1)    = i+1;  
     end


end





end