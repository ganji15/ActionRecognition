function x = calc_hmm_prob(varargin)

trans = [1];
emis = zeros(1, 11) + 1/11;

for i = 1 : nargin
   [m, ~] = size(varargin{i});
   for j = 1 : m 
        [~, estE] = hmmtrain(varargin{i}(j, :), trans, emis);
        x(i, j, :) = estE;
   end
end

end
