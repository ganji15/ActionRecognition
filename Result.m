function R=Result(x)%判断输出结果

R = 1;
for i = 2 : length(x)
    if (x(R) > x(i))
        R = i;
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

