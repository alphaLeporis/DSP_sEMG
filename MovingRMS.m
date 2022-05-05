function [y] = MovingRMS(data, len, overlap)
%MOVINGRMS Summary of this function goes here
%   Detailed explanation goes here
movrmsWin = dsp.MovingRMS(len, overlap);
y = movrmsWin(data);
end

