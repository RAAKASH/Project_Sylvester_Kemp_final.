function [ Data,A ] = Kempe(l1 ,B1,l2  )
%% Gives the range of data for a given configuration of sylvester kempe mecahnism. 
%  Note: Here the various possibilites of angles would be given.
% Hence it is necessary o check if it falls into the category of straight
% line mechanisms



%%
A = [0,0,0,0];
f=0;
t2 = [0,30,50,30]*pi /180;

for i = 1:length(B1(:,1) )

 [t2,f] = NewtonRaphson2( l1 ,B1(i,:),l2,t2 );
    
if(f==0)
A (i,:) = t2;
else
 A(i,:) = [0,0,0,0];
fprintf('broke!!!!!!! at %d',i);
t2 = t2*180/pi;
t2 = mod(t2,360);
t2 = t2*pi/180;
t2(1) =0;
end

end
A = A*180/pi;
A= mod(A,360);

fprintf('I am in data compiler \n');

Data = [B1(:,2)*180/pi,A];

end

