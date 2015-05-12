clear,clc;
test_dir = 'D:/Database/run/';

path = test_dir;
fileExt = '*.avi';
files = dir(fullfile(path,fileExt));
len = size(files,1);
for i=1:len
    fileName = strcat(path,files(i,1).name);
    ActionRecognition(fileName);
end;

 