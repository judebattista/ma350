%Program 3.6 Cubic spline plot
%Computes and plots spline from data points
%Input: x,y vectors of data points, k number of plotted points 
%   per segment
%Output: x1,y1 spline values at plotted points
function [x1,y1, x2, y2]=splineplot(x,y,k, fullX, fullY)
n=length(x);
fullN = length(fullX);
coeff=splinecoeff(x,y);
x1=[];y1=[];x2=[];y2=zeros(1, fullN);
foo = 1;
yout = 0;
for i=1:n-1           
    xs=linspace(x(i),x(i+1),k+1);
    dx=xs-x(i);
    ys=coeff(i,3)*dx; % evaluate using nested multiplication
    ys=(ys+coeff(i,2)).*dx;
    ys=(ys+coeff(i,1)).*dx+y(i);
    x1=[x1;xs(1:k)'];y1=[y1;ys(1:k)'];
    calcX = fullX(foo);
    calcY = 0;
    while calcX <= x(i)
        calcY=coeff(i,3)*calcX; %x^3 term
        calcY=(calcY+coeff(i,2))*calcX; % x^2 term 
        calcY=(calcY+coeff(i,1))*calcX % x term
        calcY = calcY + fullY(foo);
        y2(1, foo) = calcY;
        foo = foo+1;
        calcX = fullX(foo);
    end
end
x1=[x1;x(end)];y1=[y1;y(end)];
plot(x,y,'o',x1,y1)
