function r = romberg( fcn, a, b, n )
%Romberg integration of function fcn
%   on the interval a to b
%   with n rows
format long;
h = (b-a)./(2.^(0:n-1));
r(1,1) = (b-a)*(fcn(a) + fcn(b)) / 2;
for j=2:n
    subtotal = 0;
    for i = 1:2^(j-2)
        subtotal = subtotal + fcn(a+(2*i-1)*h(j));
    end
    r(j, 1) = r(j-1, 1)/2 + h(j)*subtotal;
    for k=2:j
        r(j, k) = (4^(k-1) * r(j, k-1) - r(j-1, k-1))/(4^(k-1)-1);
    end
    
end
end

