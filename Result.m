function R=Result(x)%�ж�������

R = 1;
for i = 2 : length(x)
    if (x(R) > x(i))
        R = i;
    end
end

switch R
    case 1
       msgbox('�ܲ�');
    case 2
        msgbox('����');
    case 3
        msgbox('������');
    case 4
        msgbox('����');
    otherwise
        msgbox('ʲô���');     
end

end

