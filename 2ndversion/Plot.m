function [ d ] = Plot( lengths,theta)
%% Used in Animation function
%  Plots a single frame
%% Program
b=0;  % Vertical offset

x = [0,lengths(2)*cos(theta(2)),lengths(2)*cos(theta(2))+lengths(3)*cos(theta(3)),lengths(1),0];
y = [0,lengths(2)*sin(theta(2)),lengths(4)*sin(theta(4))+b,b,0];
g = max(lengths);
plot(x,y,'r-o');
axis([-g 2*g  -g g]);
d=0;

end

