function [ P2, P3, P4, e ] = threeoneC1()
% This function compares linear, quadratic, and cubic interpolations
% on population data
x = [0;10;30;40];
y = [3039585530;3707475887;5281653820;6079603571];
pop80 = 4452584592;
%z = 1980 = 20
z = 20;
x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);
% P2 = linear between 1970 (10) and 1990 (30)
% P2 = y1 * (x-x2)/(x1-x2)
P2 = y(1)*(z-x2)/((x1-x2)) + ...
    y(2)*(z-x1)/((x2-x1));
%P3 = quadratic between 1960, 1970, 1990 (0, 10, 30)
P3 =  y(1)*(z-x2)*(z-x3)/((x1-x2)*(x1-x3)) + ...
    y(2)*(z-x1)*(z-x3)/((x2-x1)*(x2-x3))+ ...
    y(3)*(z-x1)*(z-x2)/((x3-x1)*(x3-x2));
%P4 = cubic between all four data points
P4 = y(1)*(z-x2)*(z-x3)*(z-x4)/((x1-x2)*(x1-x3)*(x1-x4)) + ...
    y(2)*(z-x1)*(z-x3)*(z-x4)/((x2-x1)*(x2-x3)*(x2-x4))+ ...
    y(3)*(z-x1)*(z-x2)*(z-x4)/((x3-x1)*(x3-x2)*(x3-x4)) + ...
    y(4)*(z-x1)*(z-x2)*(z-x3)/((x4-x1)*(x4-x2)*(x4-x3));
e = [abs(P2-pop80);abs(P3-pop80);abs(P4-pop80)];
end

