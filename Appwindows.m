            if (value == "Chebyshev 1")
                [b,a] = cheby1(app.Filter_Order, 3,[app.FilterLow, app.Filterhigh],"bandpass");
               [h,w] = freqz(b,a);
            elseif (value == "Chebyshev 2")
               [b,a] = cheby2(app.Filter_Order, 3,[app.FilterLow, app.Filterhigh],"bandpass");
               [h,w] = freqz(b,a);
            elseif (value == "ButtWorth")
               [b,a] = butter(app.Filter_Order, 3,[app.FilterLow, app.Filterhigh],"bandpass");
               [h,w] = freqz(b,a);
            elseif (value == "Bessel")
                [b,a] = Bessel(app.Filter_Order, 3,[app.FilterLow, app.Filterhigh],"bandpass");
               [h,w] = freqz(b,a);
            end 
            plot(app.FilterPlot, w/pi,20*log10(abs(h)))
            plot(app.FilterPlot, w, 360/(2*pi)*angle(H))