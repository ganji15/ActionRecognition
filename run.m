%cd('D:\temp\');
clear,clc;
 disp('input video');
% 
test_video_path = 'D:/Database/jump/eli_jump.avi';

 video = read_avi_data('D:/Database/run/denis_run.avi');
 video2 = read_avi_data('D:/Database/walk/denis_walk.avi');
 video3 = read_avi_data('D:/Database/jump/denis_jump.avi');
 video4 = read_avi_data('D:/Database/bend/daria_bend.avi');
 
 unkown_video = read_avi_data(test_video_path);
 
 disp('output video');
 x1 = tracking(video);
 x2 = tracking(video2);
 x3 = tracking(video3);
 x4 = tracking(video4);
 unkown_action = tracking(unkown_video)
 
 estE = calc_hmm_prob(x1, x2, x3, x4);
 probs = calc_prob(unkown_action, estE);
 Result(probs);
 
 %{
 e = calc_bayes_prob(x1, x2,  x3, x4);
 probs = calc_prob(unkown_action, e);
 Result(probs);
 %}
 