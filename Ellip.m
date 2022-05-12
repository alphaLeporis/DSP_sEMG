function [output] = Ellip(data, low, high, order)
%Elliptical filter
[b, a] = ellip(order, 3, [low, high], "bandpass");
output = filter(b, a, data);
end

