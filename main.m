[file,path] = uigetfile('*.txt');
if isequal(file,0)
   disp('User selected Cancel');
else
    [data, ~, ~] = FileParser(fullfile(path,file));
    disp(data)
    output = dataProcessing(data, 1, 1, 0, true, 1, 1, 0.2, 0.5);
    ch1 = output(1);
    %app.lampCH1.Color = [0 1 0];
    %app.mvcREAD(1) = 1;
    %app.reCalculateData();
end