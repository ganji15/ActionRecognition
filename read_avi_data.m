function data = read_avi_data(path)
avi = aviread(path);
data = {avi.cdata};
end
