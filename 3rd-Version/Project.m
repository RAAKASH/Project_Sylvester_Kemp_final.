 %% ****************KDOM Project********************* 
 %  Sylvester-Kempe straight line mechanism
 %  For detailed report please read pdf copy attached.
 
 %%  Getting data from user
 clc;
 close all;
 Z = imread('Capture.jpg');
 image(Z);
 fprintf('Look at the displayed picture!!!!\n');
 fprintf('Note : The link lengths specified are the default lengths of the program!!!!\n');
 fprintf('Now specify link lenghts accordingly \n');
 x = input('Link 1:');
 y = input('Link 2:');
 z = input('Link 3,4,5:');
 fprintf('Press Enter for finding data');
 pause;
 close all;
  %% Variable initialization.
 
  l1 = [z;y;x;z];  
  l2 = [z;x;y;z]; 
%    l1 = [81;100;48;81]; % Main data
%    l2 = [81;48;100;81]; % Main data
%    l1 = [100;48;81;81];
%    l1 = [8;10;5;8];     % Test data
%    l2 = [8;5;10;8];     % Test data
%    l1 = [4;10;3;4];     % Test data
%    l2 = [4;3;10;4];     % Test data

%%   Getting 4 bar data Using function Accu.m % Refer API for more details

    t = 0;              % Flag for visual representation of data aquisition 
    [b1,~] =  Accu(l1);
    
%%  Conversion of angles from deg to rad

b1 =b1*pi/180;

%% Data compiler :check API

[ Data2,A2 ] = Datacompiler2(l1,b1,l2);

%%  CROSS CHECK ,Further analysis   
  
  A2 =A2*pi/180;
  F1 = -l1(1)*cos(0)+l1(2)*cos(b1(:,2))+l1(3)*cos(b1(:,3))-l1(4)*cos(b1(:,4));
  y2 =(- l2(2)*sin(A2(:,2)+pi/2)+l1(2)*sin(b1(:,2)+pi/2));
  
  
%% Processing 
      [~,~,I2  ]= kempepro( A2,y2 );
      [k1,k2]    =  Kempepostpro( I2 );
    
     if(I2(1)~=0)
     f=1;  
     clc;
     fprintf('There are 2 branches select 1 , 2:\n');
     inp = input('Choice');
    if(inp ==1)
    e2= b1(k1,1:4);
    a2= A2(k1,1:4);
    else
    e2= b1(k2,1:4);
    a2= A2(k2,1:4);
            
    end
    else
       f=0; 
     clc;
       fprintf('Solution for Sylvester kempe mecahnism doesnt exist for these Link lengths');
     end
    
     
%%  My function for an infinite loop Animation
%    dummy = Anim( l1,l2,e2,a2,.01 );

%% Creating a Playback

if (f~=0)
    clc;
fprintf('A play back is being created\n');
[M] = PlayBack( l1,l2,e2,a2 );
numtimes=3;
fps=25;
% movie(M,numtimes,fps);
end
%%  Finding Range of motion
   q = find(e2(:,2) == max(e2(:,2)));
   maxx = (- l2(2)*cos(a2(q,2)+pi/2)+l1(2)*cos(e2(q,2)+pi/2));
   q = find(e2(:,2) == min(e2(:,2)));
   minx = (- l2(2)*cos(a2(q,2)+pi/2)+l1(2)*cos(e2(q,2)+pi/2));

%% Generating an .avi file, log file for general purpose viewing
if (f~=0)
  v = VideoWriter('Sylvester_Kempe.avi','Uncompressed AVI');
  open(v);
  writeVideo(v,M);
  close(v);
  clc;
  fprintf('An avi file Sylvester_Kempe.avi has been generated ,check the folder that contains the zip extract\n');
  fprintf(' A log file has been created ,check the folder that contains the zip extract');
 fileID = fopen('log.txt','w');
fprintf(fileID,'\n%6s %6s %6s\n','link1','link2','link3');
fprintf(fileID,'%6.2f %6.2f %6.2f\n',x,y,z);
fprintf(fileID,'\n%20s %20s \n','Max X coordinate','Min X coordinate');
fprintf(fileID,'\n     %6.2f             %6.2f \n',maxx,minx);
fprintf(fileID,'\n%20s %20s \n','Max Theta2','Min Theta2');
fprintf(fileID,'\n     %6.2f             %6.2f \n',max(e2(:,2))*180/pi,min(e2(:,2))*180/pi);
fclose(fileID);

end
