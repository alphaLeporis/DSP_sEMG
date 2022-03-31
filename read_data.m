%Reading data using fileparser
[data, t, header] = FileParser("./PP01/S1_MVC_delt_links.txt");

dataMv = (data./(2^16)-1/2).*3;

fftData= fft(dataMv);

%%Rectify data: Outliers weg mooie schaal, bereik mooi aangepast aan data
N = 8700;
df=1000/N; %frequency resolution
sampleIndex = -N/2:N/2-1; %ordered index for FFT plot
f=sampleIndex*df; %x-axis index converted to ordered frequencies
stem(f,abs(fftData)); %magnitudes vs frequencies
xlabel('f (Hz)'); ylabel('|X(k)|');

phase=atan2(imag(X),real(X))*180/pi; %phase information
plot(f,phase); %phase vs frequencie