function x = calc_prob( seq, action_emis)
%UNTITLED1 Summary of this function goes here
%  Detailed explanation goes here

function prob = calc_prob2(seq2, emis )
prob = 0;
% number of emits
[~,~,n] = size(emis);
for i = 1:length(seq2)
    index = seq2(i);
    if (seq2(i) <= 0)
        index = 1;
    elseif (seq2(i) > n)
        index = n;
    end
    
    temp_prob = emis(index);
    
    if abs(temp_prob) ~= 0
        prob = prob + log(temp_prob);
    else
        prob = prob + log(0.00001);
    end
end

end;

[r, p, ~] = size(action_emis);
for m = 1 : r
    for q = 1 :p
        x(m, q) =  calc_prob2(seq(q, :), action_emis(m, q, :));
    end
end

 disp('----------------------------------------------');

end