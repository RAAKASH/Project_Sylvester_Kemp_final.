function [ deltheta,e ] = JF3( l1,l2,t1,t2 )

e=0;
F1 = 0;
F2 = 0;
Fdash1 = [0,0];
Fdash2 = [0,0];
F1 = -l2(1)*cos(0)+l2(2)*cos(t2(2))+l2(3)*cos(t2(3))-l2(4)*cos(t2(4)); 
F2 = -l2(1)*sin(0)+l2(2)*sin(t2(2))+l2(3)*sin(t2(3))-l2(4)*sin(t2(4)) ;


Fdash1 = [  l2(3)*sin(t2(3)),0, l2(4)*sin(t2(4))];
Fdash2 = [ -l2(3)*cos(t2(3)),0,-l2(4)*cos(t2(4))];



F3 =  - l2(2)*cos(t2(2)+pi/2) +  l1(2)*cos(t1(2)+pi/2) + l2(1)*cos(0)  ...
     + l2(4)*cos( t2(4) )+ l2(3)*cos(t2(3) - pi/2) ...
     - (l1(1) + l1(4)*cos(t1(4))+ l1(3)*cos(t1(3) - pi/2));

F4 =  - l2(2)*sin(t2(2)+pi/2) +  l1(2)*sin(t1(2)+pi/2) +  l2(1)*sin(0)...
     + l2(4)*sin( t2(4) )+ l2(3)*sin(t2(3)- pi/2) ...
     - (  0   + l1(4)*sin(t1(4))+ l1(3)*sin(t1(3) - pi/2));

Fdash3 = [  l2(2)*sin(t2(2)+pi/2),-l2(3)*sin(t2(3) - pi/2), -l2(4)*sin( t2(4) )];
Fdash4 = [ -l2(2)*cos(t2(2)+pi/2), l2(3)*cos(t2(3) - pi/2),  l2(4)*cos( t2(4) )];

J = [Fdash2;Fdash3;Fdash4]; 

F = -[ F2;F3;F4];

if(norm(J)~=0)
deltheta = J\F;
e = norm(deltheta);
else
fprintf('Jacobian modulus 0!!!!!');
end
 
 
end

