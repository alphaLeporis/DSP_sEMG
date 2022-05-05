function [data] = OutlierRemoval(data, order)
%OUTLIERREMOVAL Summary of this function goes here
%   Detailed explanation goes here
standardDeviation = std(data);
meanDat = mean(data);
toRemove = (data < (meanDat-order*standardDeviation)) | (data > (meanDat+order*standardDeviation));
indicesToRemove = find(toRemove);
for i = 2:size(indicesToRemove)-1
    data(indicesToRemove(i)) = (data(indicesToRemove(i) - 1) + data(indicesToRemove(i) + 1))/2;
end