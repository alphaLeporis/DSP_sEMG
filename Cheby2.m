function [output] = Cheby2(data, low, high, order)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[b,a] = cheby2(order, 3,[low, high],"bandpass");
output = filter(b,a,data);
end

