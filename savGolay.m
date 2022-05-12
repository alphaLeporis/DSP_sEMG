function [output] = savGolay(data, order, framelen)
%Uses the govitsky golay smoothing filter
output = sgaolayfilt(data, order, framelen);
end

