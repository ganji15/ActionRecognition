function [Ox,Oy] =get_zhixin(I)
%��ͼ������ĵĸ߶�
%IΪ��ȡͼ���ļ��õ���(��ֵ)����
%I = im2I(I, graythresh(I));%ת����2����ͼ��
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
Oy=g1/g2;          %�ֱ����������
Ox=g3/g4;
figure(2);imshow(I);

%%������ĵ�
hold on
plot(Ox, Oy, 'r*')
