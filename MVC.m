function [outMVC] = MVC(path, order, isRMS)
%MVC Summary of this function goes here
%   Detailed explanation goes here
[data, t, header] = FileParser(path);
dataMv = (data(:,3:7)./(2^16)-1/2).*3;
dataNoOut = OutlierRemoval(dataMv,order);
fftData= fft(dataNoOut);
if(isRMS)
    out = MovingRMS(fftData);
else
    out =
end if
outputArg1 = inputArg1;
outputArg2 = inputArg2;
end

