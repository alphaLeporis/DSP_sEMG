function [y] = MovingRMS(data, len, overlap)
%MOVINGRMS Applies a movingRMS window to the data
movrmsWin = dsp.MovingRMS(len, overlap);
y = movrmsWin(data);
end

