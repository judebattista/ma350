function [ int, midpoints] = adaptiveQuad( fcn, a0, b0, tolerance )
% uses adaptive quadrature to calculate the area under the function fcn
% from a0 to b0 subdividing each panel if the difference between a single
% panel calculation and a two panel calculation is greater than our
% tolerance.
    int = 0; n = 1; a(1) = a0; b(1) = b0; tol(1) = tolerance; app(1) = trap(fcn, a, b);
    ndx = 1;
    while n > 0     %n is current position at the end of the list
        c = (a(n) + b(n)) / 2; oldapp = app(n);
        if (mod(ndx, 50) == 0)
           midpoints(ndx/50) = c; 
        end
        ndx = ndx + 1;
        app(n) = trap(fcn, a(n), c); app(n+1) = trap(fcn, c, b(n));
        if abs(oldapp - (app(n) +app(n+1))) < 3*tol(n)
            int = int+app(n)+app(n+1);  %success
            n = n-1;    %done with interval
        else            %set up new intervals
            b(n+1) = b(n); b(n) = c;
            a(n+1) = c;
        tol(n) = tol(n)/2; tol(n+1) = tol(n);
        n = n+1;    %go to end of list, repeat
        end
    end

function s = trap(fcn, a, b)
        s =(fcn(a) + fcn(b))*(b-a)/2;

