function [data] = OutlierRemoval(data, order)
%OUTLIERREMOVAL Summary of this function goes here
%   Detailed explanation goes here
standardDeviation = std(data);
meanDat = mean(data);
toRemove = (data < (meanDat-order*standardDeviation)) | (data > (meanDat+order*standardDeviation));
indicesToRemove = find(toRemove);
clms = size(data, 1);
for i = 1:size(indicesToRemove)
    if ~(mod(indicesToRemove(i),clms) == 0 || mod(indicesToRemove(i)-1,clms) == 0)
        data(indicesToRemove(i)) = (data(indicesToRemove(i) - 1) + data(indicesToRemove(i) + 1))/2;
    end
end