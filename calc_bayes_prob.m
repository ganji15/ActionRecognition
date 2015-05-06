function x = calc_bayes_prob(varargin)

for i = 1 : nargin
    x(i, :) = bayes(varargin{i}, 10);
end

end