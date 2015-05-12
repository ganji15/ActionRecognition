function R=Result(x)%判断输出结果


    function index = GetMostIndex(max_x)
        per_train_num = 3;
        index = 1;
        for i = 2 : length(max_x)
            if (max_x(index) < max_x(i))
                index = i;
            end
        end
        index = floor((index - 1)/per_train_num) + 1;
    end

% 众数法
%{  
[m,n] = size(x);
for j = 1 : n
    res(j) = GetMostIndex(x(:, j));
end

disp(res);
R = mode(res);
%}

% 贝叶斯连乘法
%{  //
[m,n] = size(x);
for j = 1 : m
    res(j) = sum(x(j, :));
end

R = GetMostIndex(res);
%}//

switch R
    case 1
       disp('跑步');
    case 2
        disp('行走');
    case 3
        disp('上下跳');
    case 4
        disp('弯腰');
    otherwise
        disp('什么情况');     
end


end

