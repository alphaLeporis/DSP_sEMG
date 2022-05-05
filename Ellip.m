function [output] = Ellip(data, low, high, order)
%BANDPASS Summary of this function goes here
%   Detailed explanation goes here
[b, a] = ellip(order, 3, [low, high], "bandpass");
output = filter(b, a, data);
end

