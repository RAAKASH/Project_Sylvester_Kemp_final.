 %% ****************KDOM Project********************* 
 %  Sylvester-Kempe straight line mechanism
 %  For detailed report please read pdf copy attached.
 
 %% Variable initialization.
 
  l1 = [81;100;48;81]; % Main data
  l2 = [81;48;100;81]; % Main data
 %l1 = [8;10;5;8];
 %l2 = [8;5;10;8];
 %l1 = [4;10;3;4];
 %l2 = [4;3;10;4];

%%   Getting 4 bar data Using function Datacompiler.m % Refer API for more details

 t = 0;              % Flag for visual representation of data accumulation ,

[ B1,C1,f1,A1,D1 ] = Datacompiler( l1,t ) ;  

[b1]=Branch(l1,B1);                        % Finds other branches of the same mechanism
%%  Conversion of angles from deg to rad

B1 =B1*pi/180;

b1 =b1*pi/180;

%% Data compiler   
%

[ Data1,A1 ] = Kempe(l1 ,B1,l2  );
[ Data2,A2 ] = Kempe(l1 ,b1,l2  );
%%  CROSS CHECK ,Further analysis   
  A1 =A1*pi/180;
  y1 =(- l2(2)*sin(A1(:,2)+pi/2)+l1(2)*sin(B1(:,2)+pi/2)); % Vertical lengths 
  A2 =A2*pi/180;
  y2 =(- l2(2)*sin(A2(:,2)+pi/2)+l1(2)*sin(b1(:,2)+pi/2));

%% Processing
[a2,Y2,I2  ]= kempepro( A2,y2 );
[a1,Y1,I1  ]= kempepro( A1,y1 );
    e2      = b1(I2(1):I2(end),1:4);
%%  My function for an infinite loop 
%   dummy = Anim( l1,l2,e2,a2,.01 );
%% Creating a Playback
[M] = PlayBack( l1,l2,e2,a2 );
numtimes=3;
fps=25;
movie(M,numtimes,fps);
%% Generating an .avi file for general purpose viewing

movie2avi(M, 'Sylvester_Kempe.avi', 'compression', 'none');