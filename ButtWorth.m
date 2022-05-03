function [output] = ButtWorth(data, low, high, order)
%BANDPASS Summary of this function goes here
%   Detailed explanation goes here
[b, a] = butter(order, [low, high], "bandpass");
output = filter(b, a, data);
end

