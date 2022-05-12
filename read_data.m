%Reading data using fileparser
[data, t, header] = FileParser("./PP01/S3_MVC_trapezius_links.txt");
ProcessMVC(data(:,3:7), max(data(:,3:7)))
Output(data(:,3:7), 4, 3, false, true, 2, 2, 0.2, 0.5)

dataMv = (data(:,3:7)./(2^16)-1/2).*3;

data = OutlierSTD(dataMv, 2);

Output(data, 2, 1, true, false, 2, 3, 200, 500);
%%Rectify data: Outliers weg mooie schaal, bereik mooi aangepast aan data
N = size(fftData,1);
df=1000/N; %frequency resolution
sampleIndex = 0:N/2; %ordered index for FFT plot
f=sampleIndex*df; %x-axis index converted to ordered frequencies
stem(f,abs(fftData(N/2:N, 1))); %magnitudes vs frequencies
xlabel('f (Hz)'); ylabel('|X(k)|');
figure
phase=atan2(imag(fftData(N/2:N,1)),real(fftData(N/2:N,1)))*180/pi; %phase information
plot(f,phase); %phase vs frequency

newDat = OutlierRemoval(data(:,3:7), 2)
meanFreq = meanfreq(data);
medianFreq = medfreq(data);
