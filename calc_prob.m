function x = calc_prob( seq, action_emis)
%UNTITLED1 Summary of this function goes here
%  Detailed explanation goes here

function prob = calc_prob2(seq2, emis )
prob = 0;
% number of emits
n = size(emis);
for i = 1:length(seq2)
    if (seq2(i) <= 0)
        seq2(i) = 1;
    end
    
    temp_prob = emis(seq2(i));
    
    if abs(temp_prob) ~= 0
        prob = prob + log(temp_prob);
    else
        prob = prob + log(0.00001);
    end
end

end;

[r, ~] = size(action_emis);
for m = 1 : r;
 x(m) = calc_prob2(seq, action_emis(m, :));
 fprintf('action%d prob %f\n', m, x(m));
end

end