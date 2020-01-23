function [ x, y, result, steps ] = thirteenTwoC3a( x0, y0, tol )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    f = @(x,y) (100*x^4 - 200*x^2*y + x^2 - 2*x + 100 * y^2 + 1);
    H11 = @(x, y) (1200*x^2 - 400*y + 2);
    H12 = @(x, y) (-400*x);
    H21 = @(x, y) (-400*x);
    H22 = 200;
    
    gradfx = @(x, y) 400*x^3 - 400*x*y +2*x - 2;
    gradfy = @(x, y) -200*x^2 +200*y;
    
    oldf = 0;
    newf = f(x0, y0);
    steps = 0;
    while abs(oldf - newf) > tol
        oldf = newf;
        H = [H11(x0, y0), H12(x0, y0); H21(x0, y0), H22];
        gradf = [gradfx(x0, y0); gradfy(x0, y0)];
        v = H \ (-1.*gradf);
        k = [x0; y0] + v;
        x0 = k(1);
        y0 = k(2);
        newf = f(x0, y0);
        steps = steps + 1;
    end
    x = x0;
    y = y0;
    result = newf;
end



