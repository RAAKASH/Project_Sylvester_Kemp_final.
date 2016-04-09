function [ k1,k2 ] = Kempepostpro( I )


for i= 1:(length(I)-1)
   
    if( abs(I(i)-I(i+1))>1.1)
    break;    
    end
   
end

k1 = I(1:i);
k2 = I(i+1:end);

end

