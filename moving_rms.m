[data, t, header] = FileParser("./PP01/S1_score_fast.txt");
disp(length(data(:,3)))
plot(data(:,3))
hold on
movrmsWin = dsp.MovingRMS(20);
y1 = movrmsWin(data(:,3));
plot(y1(20:end))