function R=Result(x)%�ж�������


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

% ������
%{  
[m,n] = size(x);
for j = 1 : n
    res(j) = GetMostIndex(x(:, j));
end

disp(res);
R = mode(res);
%}

% ��Ҷ˹���˷�
%{  //
[m,n] = size(x);
for j = 1 : m
    res(j) = sum(x(j, :));
end

R = GetMostIndex(res);
%}//

switch R
    case 1
       disp('�ܲ�');
    case 2
        disp('����');
    case 3
        disp('������');
    case 4
        disp('����');
    otherwise
        disp('ʲô���');     
end


end

