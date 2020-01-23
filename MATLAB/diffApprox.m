function [ forward, centered ] = diffApprox( )
%UNTITLED Summary of this function goes here
%   Find y' for y = e^2x for x close to zero
for i =1:9
    h(i) = 1/(10^i);
    forward(i) = (exp(2*(0+h(i))) - exp(0))/h(i);
    centered(i) = (exp(2*(0+h(i))) - exp(2*(0-h(i))))/(2*h(i));
end
format long;
disp('y           forward              error            centered          error')
disp(printf())
    
end

