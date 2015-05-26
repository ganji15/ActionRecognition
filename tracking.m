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
 
 % ��������������й�һ������Ϊ��һ��ʶ������
 features(1, :) = normalization(lw_ratio, 1);
 %features(2, :) = area;
 % �������ٶȱ仯����������Ϊ�ڶ���ʶ������
 features(2, :) = speed(1, :) / 3 + speed(2, :) / 5 * 3;
 
 % �Բɼ��������ݽ��д���ʹ���ݷֲ���[1,101]֮��
 [m,~] = size(features);
 for i = 1 : m
    %features(i, :) = normalization(features(i, :), 1);
    features(i, :) = arrayfun(@(x) int32(roundn(x, -1) * 10 + 1), features(i, :));
 end
 
end

