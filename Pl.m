function [ d ] = Pl( l1,l2,B,A)
%% Used in Animation function
%  Plots a single frame
%% Program
b=0;  % Vertical offset


x = [0,l1(2)*cos(B(2)),l1(2)*cos(B(2))+l1(3)*cos(B(3)),l1(1),0];
y = [0,l1(2)*sin(B(2)),l1(4)*sin(B(4))+b,b,0];
X =  (- l2(2)*cos(A(2)+pi/2)+l1(2)*cos(B(2)+pi/2));
Y = (- l2(2)*sin(A(2)+pi/2)+l1(2)*sin(B(2)+pi/2));
x1 = [X+0,X+l2(2)*cos(A(2)),X+l2(2)*cos(A(2))+l2(3)*cos(A(3)),X+l2(1)];
y1 = [Y+0,Y+l2(2)*sin(A(2)),Y+l2(4)*sin(A(4))+b,Y+b];
x2 = [0,l1(2)*cos(B(2)+pi/2),X];
y2 = [0,l1(2)*sin(B(2)+pi/2),Y];
x3 = [l1(1)+l1(4)*cos(B(4)),l1(1)+l1(4)*cos(B(4))+l1(3)*cos(B(3)-pi/2)];
y3 = [l1(4)*sin(B(4)),l1(4)*sin(B(4))+l1(3)*sin(B(3)-pi/2)];
x4 = [X+l2(2)*cos(A(2))+l2(3)*cos(A(3)),X+l2(2)*cos(A(2))+l2(3)*cos(A(3))+l2(3)*cos(A(3)-pi/2)];
y4 = [Y+l2(4)*sin(B(4))+b,Y+l2(4)*sin(B(4))+b+l2(3)*sin(A(3)-pi/2)];
x5 = [X,X,X+l2(1),X+l2(1)];
y5 = [Y,Y+l2(2)*2,Y+l2(2)*2,Y];

g = max(l1+l2);


plot(x,y,'r-o',x1,y1,'r-o',x2,y2,'r-o',x3,y3,'r-o',x4,y4,'r-o',x5,y5,'r-o');

title('Sylvester Kempe  mechanism Animation');


axis equal;
axis([-g g  -g/1.2 g*2]);
d=0;

end

