function [output] = ButtWorth(data, low, high, order)
%Butterworth filter
[b, a] = butter(order, [low, high], "bandpass");
output = filter(b, a, data);
end

