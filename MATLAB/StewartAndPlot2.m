function [out] = StewartAndPlot2 (theta)
  x1 = 5;
  x2 = 0;
  y2 = 6;
  
  L1 = 3;
  L2 = 3*sqrt(2);
  L3 = 3;
  
  gamma = pi/4;
  
  p1 = 5;
  p2 = 5;
  p3 = 3;
  
  A2 = L3*cos(theta) - x1;
  B2 = L3*sin(theta);
  A3 = L2*cos(theta + gamma) - x2;
  B3 = L2*sin(theta + gamma) - y2;
  
  D = 2*(A2*B3 - B2*A3);
  N1 = B3*(p2^2 - p1^2 - A2^2 - B2^2) - B2*(p3^2 - p1^2 - A3^2 - B3^2);
  N2 = -1*A3*(p2^2 - p1^2 - A2^2 - B2^2) + A2*(p3^2 - p1^2 - A3^2 - B3^2);
  
  x = N1/D;
  y = N2/D;
  
  plot([x x+x2+A3 x+A2+x1 x],[y y+B3+y2 y+B2 y],'r'); hold on
  plot ([0 x1 x2], [0 0 y2], 'bo')
  plot([0 x],[0 y],'r')
  plot([x1 x+A2+x1],[0 y+B2],'r')
  plot([x2 x+x2+A3],[y2 y+B3+y2],'r')
  
  
  out = N1^2 + N2^2 - p1^2 * D^2;
end
