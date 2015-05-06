%cd('D:\temp\');
clear,clc;
 disp('input video');
% 
 avi = aviread('D:/temp/run/denis_run.avi');
 video = {avi.cdata};
 avi2 = aviread('D:/temp/walk/denis_walk.avi');
 video2 = {avi2.cdata};
 avi3 = aviread('D:/temp/walk/daria_walk.avi');
 video3 = {avi3.cdata};
 avi4 = aviread('D:/temp/run/daria_run.avi');
 video4 = {avi4.cdata};
 
%  for a = 1:length(video)
%     imagesc(video{a});
%     axis image off
%     drawnow;
% end;
% close(figure(1));
 disp('output video');
 x1 = tracking(video);
 x2 = tracking(video2);
 x3 = tracking(video3);
 x4 = tracking(video4);
 trans_run = [0.9 0.1;0.1 0.9];
trans_walk = [0 1;1 0];

trans = [1];
emis = zeros(1, 10) + 1/10
[estTR, estE1] = hmmtrain(x1, trans, emis);
disp('estE1\n');
disp(estE1);
[estTR, estE2] = hmmtrain(x2, trans, emis);
disp('estE2\n');
disp(estE2);
calc_prob(x3,  estE1,estE2);
calc_prob(x4,  estE1,estE2);
 %Y = Findfmax(x);
 %N = normalization(Y,1);
 %T=Distance(N); 
 %Result(T);
 
 