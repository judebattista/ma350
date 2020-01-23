function [ xvalues, yvalues, errors, s ] = secant( fcn, a, b )
%Find a root of fcn using initial guesses a and b.
%Return the value of the calculated root, the value of fcn(root) and the
%difference between zero and fcn(root) as the error for each step along the
%way
%The errors return value is largely redundant since it is essentially the
%absolute value of the corresponding y-value. However, if the error
%calculation changes in the future, having the return value already tracked
%throughout the function will prove useful.
%The s return vector keeps a ratio of error to previous error
format long
maxIterations = 100;
xvalues = zeros(1, maxIterations);
yvalues = zeros(1, maxIterations);
errors = zeros(1, maxIterations);
s = zeros(1, maxIterations);
%Need one iteration before we can start calculating S
%TODO: find a more elegant solution. 
c = b - (fcn(b)*(b-a))/(fcn(b) - fcn(a));
xvalues(1) = c;
yvalues(1) = fcn(c);
errors(1) = abs(0 - fcn(c));
if(fcn(c)*fcn(b) < 1)
    a = c;
else
    b = c;
end

for i=2:1:maxIterations
    c = b - (fcn(b)*(b-a))/(fcn(b) - fcn(a));
    xvalues(i) = c;
    if (xvalues(i) == xvalues(i-1))
        %return
    end
    yvalues(i) = fcn(c);
    errors(i) = abs(0 - fcn(c));
    if(fcn(c)*fcn(b) < 1)
        a = c;
    else
        b = c;
    end
    s(i-1) = errors(i)/errors(i-1);
end

end

