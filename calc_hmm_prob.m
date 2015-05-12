function x = calc_hmm_prob(varargin)

trans = [1];
emis = zeros(1, 100) + 1/100;

for i = 1 : nargin
    [~, estE] = hmmtrain(varargin{i}, trans, emis);
    x(i, :) = estE;
    %disp(estE);
end

%{
for i = 1 : nargin
    m = length(varargin{i});
    state_seq = zeros(1, m) + i;
    [~, estE] = hmmestimate(varargin{i}, state_seq);
    x(i, :) = estE;
end
%}

end
