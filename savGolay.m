function [output] = savGolay(data, order, framelen)
%SAVGOLAY Summary of this function goes here
%   Detailed explanation goes here
output = sgaolayfilt(data, order, framelen);
end

