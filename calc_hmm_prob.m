function x = calc_hmm_prob(varargin)

trans = [1];
emis = zeros(1, 11) + 1/11;

for i = 1 : nargin
    [~, estE] = hmmtrain(varargin{i}, trans, emis);
    x(i, :) = estE;
    %disp(estE);
end

end
