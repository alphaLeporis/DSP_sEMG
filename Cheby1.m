function [output] = Cheby1(data, low, high, order)
%%Chebyshev type 1 filter
[b,a] = cheby1(order, 3,[low, high],"bandpass");
output = filter(b,a,data);
end

