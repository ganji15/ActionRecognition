function R = ActionRecognition(file_path)
    % 加载训练结果数据
    load mat estE;
    
    %提取待识别视频特征
    unkown_video = read_avi_data(file_path);
    unkown_action = tracking(unkown_video, 1);
    
    %根据特征以及训练结果计算每种动作的可能性
    probs = calc_prob(unkown_action, estE);
    
    %根据可能性得出结论，识别出该行为
    R = Result(probs);
end