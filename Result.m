function R=Result(x)%�ж�������

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

