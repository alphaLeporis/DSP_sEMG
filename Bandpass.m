function [output] = Bandpass(data, low, high)
%BANDPASS Summary of this function goes here
%   Detailed explanation goes here
output = bandpass(data, [low, high]);
end

