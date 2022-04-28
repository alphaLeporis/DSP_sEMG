function [output] = Cheby1(data, low, high, order)
%CHEBY Summary of this function goes here
%   Detailed explanation goes here
[b,a] = cheby1(order, 3,[low, high],"bandpass");
output = filter(b,a,data);
end

