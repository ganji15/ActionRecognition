function R = ActionRecognition(file_path)
    load mat estE;
    unkown_video = read_avi_data(file_path);
    unkown_action = tracking(unkown_video, 1);
    probs = calc_prob(unkown_action, estE);
    R = Result(probs);
end