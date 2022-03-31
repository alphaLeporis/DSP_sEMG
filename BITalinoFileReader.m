function [data, t, header] = BITalinoFileReader(file)
    addpath('./jsonlab')

    headerlines = 3;

    data = textread(file,'','headerlines', headerlines);

    header = {};

    fid = fopen(file, 'r');
    for i=1:headerlines
        header(i) = {fgets(fid)};
    end
    fclose(fid);
    
    header = JSON.parse(strrep(header{2}(2:end),' ',''));
    
    devices = fieldnames(header);
    srate = header.(devices{1}).samplingrate;
    
    if length(devices) == 1
        header = header.(devices{1});
    end
    
    dseq = diff(diff(data(:,1)));
    
    if ~isempty(setdiff(unique(diff(data(:,1))), [-15,1]))
        t =  [];
        warning('Possible sample loss detected');
    else
        t = (1:length(data))/srate;
    end
end