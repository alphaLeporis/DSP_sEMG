function [] = Output(out,outlierOrder, outlierNr, isRMS, isMVC, filterNr, filterOrder, low, high, len, overlap, isSG, SGorder, SGlength)
%OUTPUT Outputs the processed data to a file
switch outlierNr
    case 1
        outlier = ['STD order:' , num2str(outlierOrder)];
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
fprintf(fid, '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s \n', 'OutlierMethod', 'RMS used', 'RMS window length', 'RMS overlap', 'Filter Type', 'Filter order', 'low', 'high', 'Savitsky Golay', 'SGOrder', 'SGLength');
fprintf(fid, '%s,%d,%d,%d,%s,%d,%d,%d,%d,%d,%d \n', outlier, isRMS, len, overlap, filter, filterOrder, low, high, isSG, SGOrder, SGLength);
fprintf(fid, '%s,%s,%s,%s,%s \n', 'CH1', 'CH2', 'CH3', 'CH4', 'CH5');
for n = 1:size(out, 1)
  fprintf( fid, '%f,%f,%f,%f,%f\n', out(n, 1), out(n,2), out(n,3), out(n,4), out(n,5));
end
fclose(fid);
end

