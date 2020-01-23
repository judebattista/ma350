% Program 13.3 Nelder-Mead Search
% Input: inline function f, best guess xbar (column vector),
%    initial search radius rad and the tolerance, tol
% Output: matrix x whose columns are vertices of simplex,
%    function values y of those vertices
function [x,y]=neldermead(f,xbar,rad,tol)
n=length(xbar);
x(:,1)=xbar;          % each column of x is a simplex vertex
x(:,2:n+1)=xbar*ones(1,n)+rad*eye(n,n); 
for j=1:n+1
  y(j)=f(x(:,j));   % evaluate obj function f at each vertex
end
[y,r]=sort(y);        % sort the function values in ascending order
x=x(:,r);             %    and rank the vertices the same way
distanceMoved = tol + 1;
currentCenter = centroid(x(1, :), x(2, :));
while distanceMoved > tol
  xbar=mean(x(:,1:n)')';  % xbar is the centroid of the face
  xh=x(:,n+1);            %   omitting the worst vertex xh
  xr = 2*xbar - xh; yr = f(xr);
  if yr < y(n)
    if yr < y(1)      % try expansion xe
      xe = 3*xbar - 2*xh; ye = f(xe);
      if ye < yr      % accept expansion
        x(:,n+1) = xe; y(n+1) = f(xe);
      else            % accept reflection
        x(:,n+1) = xr; y(n+1) = f(xr);
      end
    else              % xr is middle of pack, accept reflection
      x(:,n+1) = xr; y(n+1) = f(xr);
    end
  else                % xr is still the worst vertex, contract
    if yr < y(n+1)    % try outside contraction xoc
      xoc = 1.5*xbar - 0.5*xh; yoc = f(xoc);
      if yoc < yr     % accept outside contraction
        x(:,n+1) = xoc; y(n+1) = f(xoc);
      else            % shrink simplex toward best point
        for j=2:n+1
          x(:,j) = 0.5*x(:,1)+0.5*x(:,j); y(j) = f(x(:,j));
        end
      end
    else              % xr is even worse than the previous worst
      xic = 0.5*xbar+0.5*xh; yic = f(xic);
      if yic < y(n+1) % accept inside contraction
        x(:,n+1) = xic; y(n+1) = f(xic);
      else            % shrink simplex toward best point
        for j=2:n+1
          x(:,j) = 0.5*x(:,1)+0.5*x(:,j); y(j) = f(x(:,j));
        end
      end
    end
  end
  %Recalculate the centeroid of the polygon and the distance it moved
  firstCoords = x(1, :);
  secondCoords = x(2, :);
  oldCenter = currentCenter;
  currentCenter = centroid(firstCoords, secondCoords);
  distanceMoved = norm(currentCenter - oldCenter);
  [y,r] = sort(y);    % resort the obj function values
  x=x(:,r);           %    and rank the vertices the same way
end
end

% centroid functionality by David Legland
% https://github.com/mattools/matGeom/blob/master/matGeom/polygons2d/polygonCentroid.m
function [centr] = centroid (px, py)
  N = length(px);
  iNext = [2:N 1];

  % compute cross products
  common = px .* py(iNext) - px(iNext) .* py;
  sx = sum((px + px(iNext)) .* common);
  sy = sum((py + py(iNext)) .* common);

  % area and centroid
  area = sum(common) / 2;
  centr = [sx sy] / 6 / area;
end 