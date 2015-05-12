function s =get_area(I)
%求图像的质心的高度
%I为读取图像文件得到的(二值)矩阵

[m,n]=size(I);
s = sum(I(:));
s = s / m / n;