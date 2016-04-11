 %% ****************KDOM Project********************* 
 %  Sylvester-Kempe straight line mechanism
 %  For detailed report please read pdf copy attached.
 %  Dynamic simulation
 %%  Getting data from user
 clc;
 close all;
 clearvars;
 figH = figure;
 set(figH,'Name','Start Window','NumberTitle','off');
 
 H = imread('Sylvester kempe_0000.jpg');
 image(H);
 set(gca,'xtick',[],'ytick',[]);
 title('Sylvester kempe -Straight line mechanism');
 
 fprintf('\n \n \nPROJECT - Sylvester_Kempe straight line mechanism\n');
 fprintf('This matlab program is a simulation of the mechanism given the initial link lengths.\n');
 fprintf('Go through the pdf file for more information.\n');
 fprintf('Press enter to start\n');
 pause;
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
%    l1 = [8;10;5;8];     % Test data
%    l2 = [8;5;10;8];     % Test data
%    l1 = [4;10;3;4];     % Test data
%    l2 = [4;3;10;4];     % Test data

%%   Getting 4 bar data Using function Accu.m % Refer API for more details
     
    [b1,~] =  Accu(l1); % Function returns Angles of a FourBar Mechanism in degrees. 
    
%%  Conversion of angles from deg to rad

b1 =b1*pi/180;

%% Data compiler2 :Refer API for more details

[ Data2,A2 ] = Datacompiler2(l1,b1,l2); %Function retuns angles of the sylvester kempe mechanism

%%  Check ,Further analysis  -To obtain a straight line mechanism
  
  A2 =A2*pi/180;
  F1 = -l1(1)*cos(0)+l1(2)*cos(b1(:,2))+l1(3)*cos(b1(:,3))-l1(4)*cos(b1(:,4));
  y2 =(- l2(2)*sin(A2(:,2)+pi/2)+l1(2)*sin(b1(:,2)+pi/2));
  
  
%% Processing - Obtains straightline mechanism ,segregates them into branches
     
     [~,~,I2  ]= kempepro( A2,y2 );  % returns valid indices of a straight line mecahnism
      
      i=1;
      K(1) = 1;    % Variable holds various branches indices
      k1=1;
      k2=length(I2);
      while(1)
      i=i+1; 
     [k1,k2,flag]    =  Kempepostpro( I2(K(i-1):end) );
     
      K(i) = K(i-1)+length(k1);
      
       if(flag==1)
       break;
      end
      end
 
      
 % Final Data display 
     
     if(I2(1)~=0)
     f=1;  
     clc;
     fprintf('There are %d branches !!!!:',length(K)-1);
     fprintf('\n');
     inp = input('Choice:');
     for i=1:(length(K)-1)
     
         if(i==inp)
            e2= b1(I2(K(i)):I2(K(i+1)-1),1:4);
            a2= A2(I2(K(i)):I2(K(i+1)-1),1:4); 
         end
         
     
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
fprintf('\n\n\nA play back is being created!!!!!!!!!!!!!!!!!!!\n');
[M] = PlayBack( l1,l2,e2,a2 );
 [m,n]= size(M);
 M(1,n+1:2*n) = M;
numtimes=3;
fps=25;
close all;
fprintf('\n Play back created!!!!!!!!!!!!!!!!!!!\n');
fprintf('\nMovie being played!!!!!!!!!!!!!!!!!!!\n');
figH = figure;
set(figH,'Name','Movie','NumberTitle','off');
movie(M,numtimes,fps);
end
%%  Finding Range of motion
   if(f~=0)
   q = find(e2(:,2) == max(e2(:,2)));
   maxx = (- l2(2)*cos(a2(q,2)+pi/2)+l1(2)*cos(e2(q,2)+pi/2));
   q = find(e2(:,2) == min(e2(:,2)));
   minx = (- l2(2)*cos(a2(q,2)+pi/2)+l1(2)*cos(e2(q,2)+pi/2));
   end
%% Generating an .avi file, log file, xls file for general purpose viewing


if (f~=0)
    close all;
     fprintf('Generating Video file, Log file ,Xl datasheet');
    v = VideoWriter('Sylvester_Kempe.avi','Uncompressed AVI');
  open(v);
  writeVideo(v,M);
  close(v);
  

fileID = fopen('log.txt','w');
fprintf(fileID,'\n%6s %6s %6s\n','link1','link2','link3');
fprintf(fileID,'%6.2f %6.2f %6.2f\n',x,y,z);
fprintf(fileID,'\n%20s %20s \n','Max X coordinate','Min X coordinate');
fprintf(fileID,'\n     %6.2f             %6.2f \n',maxx,minx);
fprintf(fileID,'\n%20s %20s \n','Max Theta2','Min Theta2');
fprintf(fileID,'\n     %6.2f             %6.2f \n',max(e2(:,2))*180/pi,min(e2(:,2))*180/pi);
fclose(fileID);
Head ={'Theta1','Theta2','Theta3','Theta4','Theta5','Theta6','Theta7','Theta8'};
xlswrite('Data',Head,'sectionI');
xlswrite('Data',[e2,a2]*180/pi,'sectionI','A2');
close all;
clc;
fprintf(' \nAn avi video file Sylvester_Kempe.avi has been generated for general purpose viewing,\n check the folder that contains the zip extract.\n'); 
fprintf(' \nA log file has been generated ,check the folder that contains the zip extract.\n\n');
fprintf(' \n A XL sheet has been generated regarding the angle configuration ,All angles in degrees\n');
end