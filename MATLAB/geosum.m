function [ val ] = geosum( x, n )
%Geosum
%   Calculate the sum 1 + x + x^2 + ... + x^n
%   for a given x value and a given n

val = 0;
for i=0:1:n
    val = val + x^i;
end
end

