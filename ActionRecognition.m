function R = ActionRecognition(file_path)
    % ����ѵ���������
    load mat estE;
    
    %��ȡ��ʶ����Ƶ����
    unkown_video = read_avi_data(file_path);
    unkown_action = tracking(unkown_video, 1);
    
    %���������Լ�ѵ���������ÿ�ֶ����Ŀ�����
    probs = calc_prob(unkown_action, estE);
    
    %���ݿ����Եó����ۣ�ʶ�������Ϊ
    R = Result(probs);
end