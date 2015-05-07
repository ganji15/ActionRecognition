function R=Result(x)%判断输出结果

R = 1;
for i = 2 : length(x)
    if (x(R) < x(i))
        R = i;
    end
end

tmp = x(R);
x(R) = x(1);
x(1) = tmp;

R2 = 2;
for i = 3 : length(x)
    if (x(R2) < x(i))
        R2 = i;
    end
end

switch R
    case 1
       msgbox('跑步');
    case 2
        msgbox('行走');
    case 3
        msgbox('上下跳');
    case 4
        msgbox('弯腰');
    otherwise
        msgbox('什么情况');     
end

end

