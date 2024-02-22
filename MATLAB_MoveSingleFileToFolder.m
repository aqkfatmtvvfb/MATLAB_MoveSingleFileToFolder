clc
clear
script_dir = pwd;
DataFilePatten=('^(?<YMD>\d{8}) (?<Other>.+)');

input_dir = uigetdir('.', 'Pick DataFile Directory');
cd(input_dir);
AllObject=dir();
AllFile=AllObject([AllObject.isdir]==0);
for iFile=1:length(AllFile)
    [filepath,name,ext] = fileparts(AllFile(iFile).name);
    DataFileInfo = regexp(name, DataFilePatten, 'names');
    if ~isempty(DataFileInfo)
        if ~exist(fullfile(input_dir,name),'dir')
            mkdir(fullfile(input_dir,name));
            movefile(fullfile(input_dir,[name ext]),fullfile(input_dir,name));
        else
            warning('Same Name Folder Exist! %s',fullfile(input_dir,name));
        end
        continue;
    end
end
cd(script_dir);



