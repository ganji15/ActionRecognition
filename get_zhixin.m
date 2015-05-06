function [Ox,Oy] =get_zhixin(I)
%求图像的质心的高度
%I为读取图像文件得到的(二值)矩阵
%I = im2I(I, graythresh(I));%转换成2进制图像
g1 = 0
g2 = 0
g3 = 0
g4 = 0
[m,n]=size(I);
for i=1:m
    for j=1:n
        g1=g1+i*I(i,j);
        g2=g2+I(i,j);
        g3=g3+j*I(i,j);
        g4=g4+I(i,j);
   end
end
Oy=g1/g2;          %手背区域的质心
Ox=g3/g4;
figure(2);imshow(I);

%%标记质心点
hold on
plot(Ox, Oy, 'r*')
