%Reading data using fileparser
[data, t, header] = FileParser("./PP01/S1_MVC_delt_links.txt");

dataMv = (data./(2^16)-1/2).*3;

fftData= fft(dataMv(:, 3:7));

%%Rectify data: Outliers weg mooie schaal, bereik mooi aangepast aan data
N = 8700;
df=1000/N; %frequency resolution
sampleIndex = 0:N/2; %ordered index for FFT plot
f=sampleIndex*df; %x-axis index converted to ordered frequencies
stem(f,abs(fftData(4350:8700,3))); %magnitudes vs frequencies
xlabel('f (Hz)'); ylabel('|X(k)|');
figure
phase=atan2(imag(fftData(4350:8700,3)),real(fftData(4350:8700,3)))*180/pi; %phase information
plot(f,phase); %phase vs frequencie

meanFreq = meanfreq(data);
medianFreq = medfreq(data);