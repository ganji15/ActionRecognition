 clear,clc;

 video = read_avi_data('D:/Database/run/daria_run.avi');
 video2 = read_avi_data('D:/Database/walk/denis_walk.avi');
 video3 = read_avi_data('D:/Database/jump/daria_jump.avi');
 video4 = read_avi_data('D:/Database/bend/daria_bend.avi');
 
 x1 = tracking(video);
 x2 = tracking(video2);
 x3 = tracking(video3);
 x4 = tracking(video4);
 
 estE = calc_hmm_prob(x1, x2, x3, x4);
 save mat estE;