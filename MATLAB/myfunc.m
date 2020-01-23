function [w, z] = myfunc(x, y)
%myfunc.m
	%This function reads in x and y and returns z = exp(x^2 plus y^2)
	z = exp(x^2+y^2);
    w=zeros(1,1000);
    for i=1:1:1000
        w(i) = i^2;
        if i == 500
            disp("Halfway there.")
        end
    end
end

