function features = tracking(video)

[x, zhixin] = calc_features(video); 
maxX = max(x);

for i = 1:length(x)
    x(i) = ceil((x(i) / maxX) * 10);
end

[x, start, stop] = find_valid_range(x);
zhixin = zhixin(:, start : stop);

     f4 = figure(4);
     set(f4, 'Position', [600 100 600 600]);
     subplot(3,1,1);
     plot(1:length(x),x);
      xlabel('��Ƶ֡��');
     ylabel('���γ����');
     title('�����˶���Ӿ��γ������');
     subplot(3,1,2);
     hist(x);
     % axis([1 g]);%X����ֵ��1��ʼ
     xlabel('���γ���ȣ�ת����');
     ylabel('�ֲ�����');
     title('�����˶���Ӿ��γ���ֲ�����');

     subplot(3,1,3);
     plot(1:length(zhixin),zhixin);
     
 
 normal_lw_ratio = normalization(x, 1);
 normal_speed = GetSpeed(zhixin);
 
 wight_lw = 0.4;
 wight_speed_x = 0.3;
 wight_speed_y = 0.3;
 features = wight_lw * normal_lw_ratio + ...
            wight_speed_x * normal_speed(1, :) + ...
            wight_speed_y * normal_speed(2, :) 

 features = normalization(features, 1);
 %{
 for i = 1 : length(features)
     features(i) = roundn(featrues, -2);
 end
%}
            
features = arrayfun(@(x) int32(roundn(x, -1) * 10 + 1), features)
%close(f3);

end

