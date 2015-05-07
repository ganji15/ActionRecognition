 test_video_path = 'D:/Database/bend/shahar_bend.avi';

 unkown_video = read_avi_data(test_video_path);
 unkown_action = tracking(unkown_video)
 
 load mat estE;
 probs = calc_prob(unkown_action, estE);
 Result(probs);