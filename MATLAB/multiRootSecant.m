function [ roots, errors ] = multiRootSecant( fcn, start, fin, numberOfRoots )
%Find multiple roots of fcn within the interval[start, end].
%Return the value of the calculated root, and the
%difference between zero and fcn(root) as the error for each root
for int rootNdx = 1:1:numRoots
maxIterations = 100;
interval = floor((fin-start)/numberOfRoots);
xvalues = zeros(1, maxIterations);
yvalues = zeros(1, maxIterations);
errors = zeros(1, maxIterations);
for i=1:1:maxIterations
    c = b - (fcn(b)*(b-a))/(fcn(b) - fcn(a));
    xvalues(i) = c;
    yvalues(i) = fcn(c);
    errors = abs(0 - fcn(c));
    if(fcn(c)*fcn(b) < 1)
        a = c;
    else
        b = c;
    end
end

end


