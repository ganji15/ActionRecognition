clear,clc;
test_dir = 'D:/Database/jump/'; %待识别动作的文件夹路径

% 获取目标路径下的所有avi文件
path = test_dir;
fileExt = '*.avi';
files = dir(fullfile(path,fileExt));
len = size(files,1);
for i=1:len
    fileName = strcat(path,files(i,1).name);
    %对目标文件进行行为识别
    ActionRecognition(fileName);
end;

 