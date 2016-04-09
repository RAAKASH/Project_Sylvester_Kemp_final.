function [M] = PlayBack( l1,l2,B,A)
%% Function for Playback of  a sylvester kempe mechanism. 
%**************API******************
% input arguments :
% l1 = length of Ist four bar members
% l2 = length of Ist four bar members
% B = theta of branch 1 in rad
% A = theta of branch 2 in rad
% t = speed of animation    % Any value less than .014 wont give reasonable
%                             results (ie) 71 fps.

% output :
% Animates the motion
% ***********************************

%% Functions used 
% Plot( lengths,theta)
%% Main Program

% d = choice of branch
i = 1; % Iter number 
g = 0; % flag
s = 1; % step
c = 0; % count  
f = 0;
 while(1)
           
       f=f+1;     
    
            if((i==size(B,1)))
             
             if ((abs(B(i,2)-359)<=.1) && (abs(B(1,2)-1)<=.1))
             i=1;s=1;
             else
             s=-1;
             end
             
            end
             if(i ==1)
             c = c+1;
             s=1;
             end 
             
             e  =  Pl( l1,l2,B(i,:),A(i,:));

    M(f) = getframe;
    hold off;
  if(c==2)
      break;
  end
  i = i + s;
     

 end
         
end



