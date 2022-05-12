function [out] = dataProcessing(data, outlierOrder, outlierNr, isRMS, isMVC, filterNr, filterOrder, low, high, len, overlap, isSG, SGorder, SGlength)
%DATAPROCESSING processes all of the data and outputs the result
dataMv = (data(:,3:7)./(2^16)-1/2).*3; %Converts the data to mV
switch outlierNr %Removes outliers based on the chosen method
    case 1 %Standard deviation method
        dataNoOut = OutlierSTD(dataMv, outlierOrder);
    case 2 %Interquartile distance
        dataNoOut =IQROutlier(dataMv);
    case 3 %Generalized extreme student deviate test
        dataNoOut = StudentizedDeviateTest(dataMv);
    case 4 %Z-Score
        dataNoOut =ZScore(dataMv);
end

%Calculate the fft
fftData= fft(dataNoOut);

if(isRMS) %If Rout Mean Square is chosen
    out = MovingRMS(fftData, len, overlap);
else %If filterting is chosen
    if(isSG)
        fftData = savGolay(fftData, SGorder, SGlength);
    end
    switch filterNr %Select the desired filter
        case 1 %Chebishev 1 filter
            outFilt = Cheby1(fftData, low, high, filterOrder);
        case 2 %Chebyshev 2 filter
            outFilt = Cheby2(fftData, low, high, filterOrder);
        case 3 %Butterworth filter
            outFilt = ButtWorth(fftData, low, high, filterOrder);
        case 4 %Bessel filter
            outFilt = Bessel(fftData, low, high, filterOrder);
        case 5 %Elliptical filter
            outFilt = Ellip(fftData, low, high, filterOrder);
    end
    out = abs(outFilt); %Rectify data
end

if(isMVC) %If this is a MVC file we only output a vector with the max values of each column
    out = max(out);
end

end

