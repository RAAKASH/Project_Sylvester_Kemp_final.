function [e] = Anim( l1,l2,B,A,t )
%% Function for animation of a sylvester kempe mechanism. 
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
    
 while(1)
             if((i==size(B,1)))
        
             if ((abs(B(i,2)-359)<=.1) && (abs(B(1,2)-1)<=.1))
             i=1;s=1;
             else
             s=-1;
             end
             
            end
         if(i ==1)
             
             s=1;
         end
         
  
          
    e  =  Pl( l1,l2,B(i,:),A(i,:));
%     g = @() Pl(l1,l2,B(i,:),A(i,:));
%     time = timeit(g) 
    hold off;
     i = i + s;
     if(t~=0)
      pause(t);
     end

 end
e=0;         
end



