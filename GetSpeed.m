function speed = GetSpeed(pos)

% 计算每一帧速度的平方
for i = 2 : length(pos)
    speed(:,i) = (pos(: , i) - pos(:, i - 1)).^2;
end
speed(:, 1) = speed(:, 2);

max_x = max(abs(speed(1, :)));
max_y = max(abs(speed(2, :)));

% 规范化到0-1之间
speed(1, :) = speed(1, :) / max_x;
speed(2, :) = speed(2, :) / max_y;

end