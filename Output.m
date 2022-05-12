function [outputArg1,outputArg2] = Output(out,outlierOrder, outlierNr, isRMS, isMVC, filterNr, filterOrder, low, high)
%OUTPUT Summary of this function goes here
%   Detailed explanation goes here
switch outlierNr
    case 1
        outlier = 'STD';
    case 2
        outlier = 'IQR';
    case 3 
        outlier = 'GESD';
    case 4
        outlier = 'Z-Score';
end
switch filterNr
        case 1
            filter = 'Chebyshev 1';
        case 2
            filter = 'Chebyshev 2';
        case 3
            filter = 'Butterworth';
        case 4
            filter = 'Bessel';
        case 5
            filter = 'Elliptic';
    end
fid = fopen( 'results.txt', 'wt' );
fprintf(fid, '%15s %15s %15s %15s %15s %15s %15s\n', 'OutlierMethod:', 'RMS used', 'Filter Used', 'Filter Type', 'Filter order', 'low', 'high');
fprintf(fid, '%15s %15s %15s %15s %15s %15s %15s\n', '', outlier, isRMS, filter, filterOrder, low, high);
fprintf(fid, '%12s %12s %12s %12s %12s\n', 'CH1', 'CH2', 'CH3', 'CH4', 'CH5');
for n = 1:size(out, 1)
  fprintf( fid, '%12f %12f %12f %12f %12f\n', out(n, 1), out(n,2), out(n,3), out(n,4), out(n,5));
end
fclose(fid);
end

