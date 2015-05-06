function probs = bayes(data, range)

probs = zeros(1, range);
size = length(data);

for i = 1:size
    idx = data(i);
    probs(idx) = probs(idx) + 1;
end

for i = 1:range
    probs(i) = probs(i) / size;
end

