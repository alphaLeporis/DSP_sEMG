function [output] = savGolay(data, order, framelen)
%Uses the govitsky golay smoothing filter
output = sgolayfilt(data, order, framelen);
end

