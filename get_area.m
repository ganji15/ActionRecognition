function s =get_area(I)
%��ͼ������ĵĸ߶�
%IΪ��ȡͼ���ļ��õ���(��ֵ)����

[m,n]=size(I);
s = sum(I(:));
s = s / m / n;