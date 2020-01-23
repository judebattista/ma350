function [ error ] = twoNorms( r )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    limit = length(r);
    error = 0;
    for ndx = 1:1:limit
        error = error + (r(ndx, 1)*r(ndx, 1));
    end
    error = sqrt(error);
end

