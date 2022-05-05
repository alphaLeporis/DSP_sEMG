function [out] = dataProcessing(path, outlierOrder, isRMS, isMVC, filterNr, filterOrder, low, high)
%MVC Summary of this function goes here
%   Detailed explanation goes here
[data, t, header] = FileParser(path);
dataMv = (data(:,3:7)./(2^16)-1/2).*3;
dataNoOut = OutlierRemoval(dataMv,outlierOrder);
fftData= fft(dataNoOut);
if(isRMS)
    out = MovingRMS(fftData);
else
    switch filterNr
        case 1
            outFilt = Cheby1(data, low, high, filterOrder);
        case 2
            outFilt = Cheby2(data, low, high, filterOrder);
        case 3
            outFilt = ButtWorth(data, low, high, filterOrder);
        case 4
            outFilt = Bessel(data, low, high, filterOrder);
        case 5
            outFilt = Ellip(data, low, high, filterOrder);
    end
    out = abs(outFilt);
end

if(isMVC)
    out = max(out);
end

end
