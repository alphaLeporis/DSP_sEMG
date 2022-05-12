function [output] = Bessel(data, low, high, order)
%%Chebyshev type 2 filter
[b,a] = Bessel(order,[low, high],"bandpass");
output = filter(b,a,data);
end

