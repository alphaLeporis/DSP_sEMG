function [data] = StudentizedDeviateTest(data)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
toRemove= isoutlier(data, "gesd");
indicesToRemove = find(toRemove);
clms = size(data, 1);
for i = 1:size(indicesToRemove)
    if ~(mod(indicesToRemove(i),clms) == 0 || mod(indicesToRemove(i)-1,clms) == 0) %Don't take into account first and last element of a column
        data(indicesToRemove(i)) = (data(indicesToRemove(i) - 1) + data(indicesToRemove(i) + 1))/2;
    end
end
end

