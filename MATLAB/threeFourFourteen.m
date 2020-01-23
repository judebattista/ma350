## Copyright (C) 2018 Xaoshaen
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} threeFourFourteen (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Xaoshaen <Xaoshaen@JAYNE>
## Created: 2018-04-24

function [interpolatedY] = threeFourFourteen (exes, whys, xToCalc)
  terms = length(exes);
  numPlotPoints = length(xToCalc);
  interpolatedY = zeros(1, numPlotPoints);
  calculatedY = 0;
  ##calculates each term of the Lagrange interpolation at the appropriate x
  for jan = 1:numPlotPoints
    x = xToCalc(jan);
    calculatedY = 0;
    for sna=1:terms
      denominator = 1; 
      numerator = 1;
      ##calculate the numerator for each term
      for foo=1:terms
        if foo != sna
          numerator = numerator * (x - exes(foo));
        endif
      endfor
      #calculate the denominator for each term
      for bar=1:terms
        if bar != sna
          denominator = denominator * (exes(sna) - exes(bar));        
        endif
      endfor
      term = numerator * whys(sna) / denominator;
      calculatedY = calculatedY + term;
    endfor
    interpolatedY(1, jan) = calculatedY;
  endfor
endfunction
