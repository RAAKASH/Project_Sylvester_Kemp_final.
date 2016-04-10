function [e] = Animation( lengths,B,C,f,d,t )
%% Function for animation of a four bar mechanism. 
%**************API******************
% input arguments :
% lengths = length of four bar members
% B = theta of branch 1 in rad
% C = theta of branch 2 in rad
% d = choice of branch
% t = speed of animation
% f = number of branches
% x = I31 abscissa
% y = I31 ordinate
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


if(f==2)
    
 if(d==1)
         while(1) 
         if((i==size(B,1)))
         s = -1;
         end
         if(i==1)
         s = 1;   
         end
    
      axis equal;
    e  =  Plot( lengths,B(i,:));
    
    pause(t);
    i = i + s;
     
         end
 elseif(d ==2)
      while(1)
     if((i==size(C,1)))
         s = -1;
     end
     if(i==1)
         s = 1;   
     end
   axis equal;              
   e =  Plot( lengths,C(i,:));
    i = i+s;
    pause(t);
      end
end
elseif(f==1)
    
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
         
  
        axis equal;  
    e  =  Plot( lengths,B(i,:));
     hold off;
     i = i + s;
      pause(t);

         end
end
e=0;
end
