%Reading data using fileparser
[data, t, header] = FileParser("./PP01/S1_MVC_delt_links.txt");

dataMv = (data./(2^16)-1/2).*3;

fftData= fft(dataMv);

%%Rectify data: Outliers weg mooie schaal, bereik mooi aangepast aan data