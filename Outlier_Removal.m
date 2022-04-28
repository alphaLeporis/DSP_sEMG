[data, t, header] = FileParser("./PP01/S1_MVC_delt_links.txt");

dataNoOutliers = rmoutliers(data);

standardDeviation = std(data);
%%mean = mean(data);

noOutlier = OutlierRemoval(data(:, 3), 2)