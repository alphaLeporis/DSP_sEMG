function [output] = Cheby2(data, low, high, order)
%Chebyshev type 2 filter
[b,a] = cheby2(order, 3,[low, high],"bandpass");
output = filter(b,a,data);
end

