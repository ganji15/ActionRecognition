% 寻找有效范围，从第一个波峰到最后一个波谷
function [Y, start, stop] = find_valid_range(X)

size = length(X);

%找第一个波峰
start_dir = 0;
for i = 1:size-1
    if start_dir == 0
        if X(i+1) > X(i)
            start_dir = 1;
        elseif X(i+1) < X(i)
            start_dir = -1;
        end
    elseif start_dir == 1
        if X(i+1) < X(i)
            start = i;
            break
        end
    elseif start_dir == -1
        if X(i+1) < X(i)
            continue
        else
            start_dir = 1;
        end
    end
end

%找最后一个波谷
end_dir = 0;
for i = size:-1:2
    if end_dir == 0
        if X(i-1) > X(i)
            end_dir = -1;
        elseif X(i-1) < X(i)
            end_dir = 1;
        end
    elseif end_dir == 1
        if X(i-1) > X(i)
            stop = i;
            break
        end
    elseif end_dir == -1
        if X(i-1) >= X(i)
            continue
        else
            end_dir = 1;
        end
    end
end

Y = X(start: stop);

end