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
## @deftypefn {} {@var{retval} =} threeTwoFour (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Xaoshaen <Xaoshaen@JAYNE>
## Created: 2018-04-24

function [predictedBbl] = threeTwoFour (years, bbl, targetYear)
  terms = length(years);
  predictedBbl = 0;
  ## targetYear is just the x value at which to calculate P(x)
  ## targetYear makes a better parameter name, but hell if I want to type
  ## it out in a formula...
  x = targetYear; 
  ##calculates each term of the Lagrange interpolation
  for i=1:terms
    denominator = 1; 
    numerator = 1;
    ##calculate the numerator for each term
    for foo=1:terms
      if foo != i 
        numerator = numerator * (x - years(foo));
      endif
    endfor
    #calculate the denominator for each term
    for bar=1:terms
      if bar != i
        denominator = denominator * (years(i) - years(bar));        
      endif
    endfor
    term = numerator * bbl(i) / denominator;
    predictedBbl = predictedBbl + term;
  endfor

endfunction
