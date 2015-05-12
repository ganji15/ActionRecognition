function [hw_ratio, zhixin, area] = calc_features(video, display)

if nargin < 2
    display = 0;
end

if ischar(video)
     % Load the video from an avi file.
     avi = aviread(video);
     pixels = double(cat(4,avi(1:1:end).cdata))/255;
     clear avi
 else
     % Compile the pixel data into a single array
     pixels = double(cat(4,video{1:1:end}))/255;%%%%%%%%%%%%%%%%
     clear video
end

 
% Convert to RGB to GRAY SCALE image.
 nFrames = size(pixels,4);
 for f = 1:nFrames
     pixel(:,:,f) = (rgb2gray(pixels(:,:,:,f)));  %�ҶȻ�
 end
 
rows=size(pixel,1);%144����
cols=size(pixel,2); %180����
 BG=pixel(:,:,1);%����
  X=1:min([40,nFrames]);%����ƽ��ʱ��Ҫ��֡��
  for u=1:rows
      for v=1:cols
          for t=1:min([40,nFrames])
              X(t)=pixel(u,v,t);                       
          end
          BG(u,v)=median(X); %����ÿ�е��м�ֵ������ż�������򷵻��м�����ֵ��ƽ��ֵ 
          %Y=sort(X);
          %BG(u,v)=mean(Y(10:30));
      end
  end        %�˶γ����ǵõ��ɾ��ı���ͼƬ��ʹ�õ���ͳ��ƽ������

   
 if display
    f1 = figure(1);
    set(f1, 'Position', [200 100 400 400]);
    imshow(BG);%��ʾ����ͼƬ
     f2 = figure(2);
     set(f2, 'Position', [200 600 400 400]);
    
 end
 
nrames=f;
 
for l = 2:nrames
 d(:,:,l)=(abs(pixel(:,:,l)-BG));%����������
 k=d(:,:,l);
 bw(:,:,l) = im2bw(k, .2);%ת���ɶ�ֵͼ��
 bw1(:,:,l)=bwlabel(bw(:,:,l));%��Ƕ�ֵͼ�����ͨ����
 se=strel('disk',1);%����ָ����̬ѧ�ṹ��������̬ѧ����
 bw2(:,:,l)=imopen(bw1(:,:,l),se);%������
 bw3(:,:,l)=imclose(bw2(:,:,l),se);%�����㣬�����ֵͼ��
 
 if display
     imshow(bw3(:,:,l));%��ʾ��ֵ��ͼƬ
     figure(2);
     hold on%���ֵ�ǰͼ�ν���
 end
 
 cou=1;%��ʾ��һ��������������������
 for h=1:rows%��ֵ
     for w=1:cols%��ֵ
         if(bw3(h,w,l)>0.5)%����ֵ����0.5
             toplen = h;%���Ϸ�
             if (cou == 1)
                 tpln=toplen;
             end
             cou=cou+1;
             break
         end
     end
 end%����
 
coun=1;%��ʾ��һ������������������ֵ
 for w=1:cols%��ֵ
     for h=1:rows%��ֵ
         if(bw3(h,w,l)>0.5)
             leftsi = w;%���
             if (coun == 1)
                 lftln=leftsi;
                 coun=coun+1;
             end
             break
         end
     end
 end%����

 widh=leftsi-lftln;%�궨���
 heig=toplen-tpln;%�궨��ֵ
 
widt=widh/2;%ȷ���궨���ĵĺ����꣬�궨����λ�ڱ궨���ο�����λ��
 heit=heig/2;%ȷ���궨���ĵ�������
 
with=lftln+widt;%�궨���λ�á����
heth=tpln+heit;%�궨���λ�á��߶�

 x(l-1)=heig/widh;%�õ������
 [zhixin(1, l-1), zhixin(2, l-1)] = get_zhixin(bw3(:,:,l), display);
 area(l - 1) = get_area(bw3(:,:,l));
 
 if display
     rectangle('Position',[lftln tpln widh heig],'EdgeColor','r');%�����widh,�߶���heig,�߿���ɫ�Ǻ�ɫ��
     plot(with,heth, 'r+');%��ʾ�궨�� 
     drawnow;
     hold off
 end
 
 end;
 if display
     close(f1);
     close(f2);
 end
 
 hw_ratio = x;