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
     pixel(:,:,f) = (rgb2gray(pixels(:,:,:,f)));  %灰度化
 end
 
rows=size(pixel,1);%144行数
cols=size(pixel,2); %180列数
 BG=pixel(:,:,1);%背景
  X=1:min([40,nFrames]);%背景平均时需要的帧数
  for u=1:rows
      for v=1:cols
          for t=1:min([40,nFrames])
              X(t)=pixel(u,v,t);                       
          end
          BG(u,v)=median(X); %返回每列的中间值，如是偶数个，则返回中间两个值的平均值 
          %Y=sort(X);
          %BG(u,v)=mean(Y(10:30));
      end
  end        %此段程序是得到干净的背景图片，使用的是统计平均方法

   
 if display
    f1 = figure(1);
    set(f1, 'Position', [200 100 400 400]);
    imshow(BG);%显示背景图片
     f2 = figure(2);
     set(f2, 'Position', [200 600 400 400]);
    
 end
 
nrames=f;
 
for l = 2:nrames
 d(:,:,l)=(abs(pixel(:,:,l)-BG));%背景减除法
 k=d(:,:,l);
 bw(:,:,l) = im2bw(k, .2);%转换成二值图像
 bw1(:,:,l)=bwlabel(bw(:,:,l));%标记二值图像的连通区域
 se=strel('disk',1);%生成指定形态学结构，用于形态学处理
 bw2(:,:,l)=imopen(bw1(:,:,l),se);%开运算
 bw3(:,:,l)=imclose(bw2(:,:,l),se);%闭运算，所需二值图像
 
 if display
     imshow(bw3(:,:,l));%显示二值化图片
     figure(2);
     hold on%保持当前图形界面
 end
 
 cou=1;%表示第一次遇到符合条件的行数
 for h=1:rows%行值
     for w=1:cols%列值
         if(bw3(h,w,l)>0.5)%像素值大于0.5
             toplen = h;%最上方
             if (cou == 1)
                 tpln=toplen;
             end
             cou=cou+1;
             break
         end
     end
 end%上下
 
coun=1;%表示第一次遇到满足条件的列值
 for w=1:cols%列值
     for h=1:rows%行值
         if(bw3(h,w,l)>0.5)
             leftsi = w;%左边
             if (coun == 1)
                 lftln=leftsi;
                 coun=coun+1;
             end
             break
         end
     end
 end%左右

 widh=leftsi-lftln;%标定宽度
 heig=toplen-tpln;%标定列值
 
widt=widh/2;%确定标定中心的横坐标，标定中心位于标定矩形框中心位置
 heit=heig/2;%确定标定中心的列坐标
 
with=lftln+widt;%标定点的位置、宽度
heth=tpln+heit;%标定点的位置、高度

 x(l-1)=heig/widh;%得到长宽比
 [zhixin(1, l-1), zhixin(2, l-1)] = get_zhixin(bw3(:,:,l), display);
 area(l - 1) = get_area(bw3(:,:,l));
 
 if display
     rectangle('Position',[lftln tpln widh heig],'EdgeColor','r');%宽度是widh,高度是heig,边框颜色是红色的
     plot(with,heth, 'r+');%显示标定点 
     drawnow;
     hold off
 end
 
 end;
 if display
     close(f1);
     close(f2);
 end
 
 hw_ratio = x;