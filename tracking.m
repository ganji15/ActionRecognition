function features = tracking(video, display)

if nargin < 2
   display = 0;
end

[lw_ratio, zhixin, area] = calc_features(video, display); 
maxX = max(lw_ratio);

for i = 1:length(lw_ratio)
    lw_ratio(i) = ceil((lw_ratio(i) / maxX) * 10);
end

[lw_ratio, start, stop] = find_valid_range(lw_ratio);
zhixin = zhixin(:, start : stop);
area = area(start : stop);
speed = GetSpeed(zhixin);
 
 % 将长宽比特征序列归一化，作为第一个识别特征
 features(1, :) = normalization(lw_ratio, 1);
 %features(2, :) = area;
 % 将质心速度变化特征序列最为第二个识别特征
 features(2, :) = speed(1, :) / 3 + speed(2, :) / 5 * 3;
 
 % 对采集到的数据进行处理，使数据分布在[1,101]之间
 [m,~] = size(features);
 for i = 1 : m
    %features(i, :) = normalization(features(i, :), 1);
    features(i, :) = arrayfun(@(x) int32(roundn(x, -1) * 10 + 1), features(i, :));
 end
 
end

