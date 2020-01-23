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
## @deftypefn {} {@var{retval} =} DrawStewart (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Xaoshaen <Xaoshaen@JAYNE>
## Created: 2018-03-21

function [] = DrawStewart (xvals, yvals, x1, x2, y2)
  hold off;
  trianglex = xvals;
  triangley = yvals;
  plot(trianglex, triangley, 'r');
  hold on;
  plot([0, x1, x2], [0, 0, y2], 'bo');
  
  #plot struts
  plot([0, trianglex(1)], [0,triangley(1)], 'r');
  plot([trianglex(2), x1], [triangley(2),0], 'r');
  plot([trianglex(3), x2], [triangley(3),y2], 'r');
  hold off;
endfunction
