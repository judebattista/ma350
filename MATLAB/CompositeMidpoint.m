function [ sum ] = CompositeMidpoint( fcn, a, b, m )
%CompositeMidpoint calculates the integral of a function fcn
%   On an interval a to b
%   with m panels
%   using the composite midpoint method
    h = (b-a)/m;
    sum = 0;
    for i=1:1:m
        w = a + ((2*i-1)* h / 2);
        y = fcn(w);
        sum = sum + y;
    end
    sum = h * sum;
end

