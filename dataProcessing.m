function [out] = dataProcessing(data, outlierOrder, outlierNr, isRMS, isMVC, filterNr, filterOrder, low, high, len, overlap)
%MVC Summary of this function goes here
%   Detailed explanation goes here
dataMv = (data(:,3:7)./(2^16)-1/2).*3;
switch outlierNr
    case 1
        dataNoOut = OutlierSTD(dataMv, outlierOrder);
    case 2
        dataNoOut =IQROutlier(dataMv);
    case 3 
        dataNoOut = StudentizedDeviateTest(dataMv);
    case 4
        dataNoOut =ZScore(dataMv);
end
fftData= fft(dataNoOut);
if(isRMS)
    out = MovingRMS(fftData, len, overlap);
else
    switch filterNr
        case 1
            outFilt = Cheby1(fftData, low, high, filterOrder);
        case 2
            outFilt = Cheby2(fftData, low, high, filterOrder);
        case 3
            outFilt = ButtWorth(fftData, low, high, filterOrder);
        case 4
            outFilt = Bessel(fftData, low, high, filterOrder);
        case 5
            outFilt = Ellip(fftData, low, high, filterOrder);
    end
    out = abs(outFilt);
end

if(isMVC)
    out = max(out);
end

end

