% Problem 2.5.C4 using Successive Over Relaxation
% Yeah, the function name is misleading.
% Inputs: w is the omega factor, which sounds like an 80's TV show,
%   but is really just a weight.
% Output: solution x
function [x] = twofiveC2(w)
  format long
  % Should paramaterize these for general use. But not for one problem!
  n = 6;
  k = 6;
  %create the diagonals of our sparse matrix in the columns of v
  v = [-1.*ones(n, 1),3.*ones(n, 1), -1.*ones(n,1)];
  %create the tridiagonal matrix
  a = spdiags(v, [-1, 0, 1], n, n);
  % modify the off diagonal
  a(1, n) = 0.5;
  a(2, n-1) = 0.5;
  a(n, 1) = 0.5;
  a(n-1, 2) = 0.5;
  %define our RHS
  b = [2.5;1.5;1;1;1.5;2.5];
  d=diag(a);        % extract diagonal of a
  % full is not computationally efficient, but it's way easier to read and debug.
  % Since we're only doing six steps, guess which consideration wins? 
  D = full(diag(d));
  l = full(tril(a));
  L = l - D;
  u = full(triu(a));
  U = u - D;
  x=zeros(n,1);     % initialize vector x to zeros
  for itr=1:k % loop for SOR iteration  
    x = (inv((w*L + D)))*((1-w)*D*x - w*U*x) + (w*inv(w*L + D)*b);
  end
end
