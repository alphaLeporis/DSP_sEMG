[data, t, header] = FileParser("./PP01/S1_MVC_delt_links.txt");

dataNoOutliers = rmoutliers(data);