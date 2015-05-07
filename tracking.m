function features = tracking(video)

[x, zhixin] = calc_features(video); 
maxX = max(x);

for i = 1:length(x)
    x(i) = ceil((x(i) / maxX) * 10);
end

[x, start, stop] = find_valid_range(x);
zhixin = zhixin(:, start : stop);
%{
     f4 = figure(4);
     set(f4, 'Position', [600 100 600 600]);
     subplot(3,1,1);
     plot(1:length(x),x);
      xlabel('视频帧数');
     ylabel('矩形长宽比');
     title('人体运动外接矩形长宽比例');
     subplot(3,1,2);
     hist(x);
     % axis([1 g]);%X轴数值从1开始
     xlabel('矩形长宽比（转换后）');
     ylabel('分布比例');
     title('人体运动外接矩形长宽分布比例');

     subplot(3,1,3);
     plot(1:length(zhixin),zhixin);
%}

 
 normal_lw_ratio = normalization(x, 1);
 normal_speed = GetSpeed(zhixin);

 %{
 wight_lw = 0.4;
 wight_speed_x = 0.3;
 wight_speed_y = 0.3;
 features = wight_lw * normal_lw_ratio + ...
            wight_speed_x * normal_speed(1, :) + ...
            wight_speed_y * normal_speed(2, :) ;
%}
 features(1, :) = normal_lw_ratio;
 features(2, :) = normal_speed(1, :) + normal_speed(2, :);
 
 [m,~] = size(features);
 for i = 1 : m
    features(i, :) = normalization(features(i, :), 1);
    features(i, :) = arrayfun(@(x) int32(roundn(x, -1) * 10 + 1), features(i, :));
 end
 
end

