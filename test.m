clear;
a = [1, 2;3,4]
arr (:, :, 1) = a;
arr (:, :, 2) = a.*2;
arr (:, :, 3) = a.*3;
disp(arr)
size(arr)