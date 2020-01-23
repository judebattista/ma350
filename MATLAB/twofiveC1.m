% Problem 2.5.C1 using the Jacobi Method
% Inputs: n is the size of the n by n tridiagonal matrix
% Output: solution x, number of steps itr, the error e
function [x, itr, error] = twofiveC1(n)
  format long
  %create the diagonals of our sparse matrix in the columns of v
  v = [-1.*ones(n, 1),3.*ones(n, 1), -1.*ones(n,1)];
  %create the tridiagonal matrix
  a = spdiags(v, [-1, 0, 1], n, n);
  %define our RHS, a column vector of 1s sandwiched by a pair of twos
  b = ones(n, 1);
  b(1, 1) = 2;
  b(n, 1) = 2;
  target=ones(n, 1); %We know the answer should be [1....1]
  maxErr = 5e-7;    % set our tolerance
  error = 1;        % ensure the initial error is larger than our tolerance
  itr = 0;          % loop counter
  d=diag(a);        % extract diagonal of a
  r=a-diag(d);      % r is the remainder
  x=zeros(n,1);     % initialize vector x to zeros
  while error > maxErr % loop for Jacobi iteration  
    itr = itr + 1;  % count how many times we've done this
    x=(b-r*x)./d;   % Jacobi!
    diff = abs(target - x); % Calculate the difference between x and the target
    error = max(diff);  % Our infinite norm is the largest such difference
  end
end
