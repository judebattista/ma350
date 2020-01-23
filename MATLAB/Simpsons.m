function [ sum ] = Simpsons(fcn, a, b, m)
%UNTITLED Summary of this function goes here
%   Find a Simpson's rule approximation for:
%       a function fcn
%       on the interval a to b
%       with m panels. m must be even!
format long;
sum = fcn(a) + fcn(b);
h = (b-a)/m;
coeffs = ones(1, m-1);
%Odd coefficients are two
for i=2:2:m-2
    coeffs(1, i) = 2*coeffs(1, i);
end
%even coefficients are four
for i=1:2:m-1
    coeffs(1, i) = 4*coeffs(1, i);
end
for i=1:1:m-1
    y = fcn(i*h+a);
    sum = sum + coeffs(1, i) * y;
end
sum = sum * h / 3;

end