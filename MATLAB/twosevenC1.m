function [ x1 ] = twosevenC1( u, v, k )
% Newton's method for systems of non-Linear equations
x0 = [u;v];

for i=1:k
    f1 = u^2 + 4*v^2;
    f2 = 4*u^2 + v^2;
    df1du = 2*u;
    df1dv = 2*v;
    df2du = 2*u - 2;
    df2dv = 2*v;
    b = [f1;f2];
    A = [[df1du, df1dv]; [df2du, df2dv]];
    s = A\b;
    x1 = x0 - s;
end

end

