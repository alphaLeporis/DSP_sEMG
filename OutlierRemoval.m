function [dataNoOutlier] = OutlierRemoval(data, order)
%OUTLIERREMOVAL Summary of this function goes here
%   Detailed explanation goes here
standardDeviation = std(data);
meanDat = mean(data);
indicesToRemove = (data < (meanDat-order*standardDeviation)) | (data > (meanDat+order*standardDeviation));
dataNoOutlier = data;
dataNoOutlier(indicesToRemove) = [];
end

