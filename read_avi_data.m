function data = read_avi_data(path)
warning off all;
avi = aviread(path);
data = {avi.cdata};
end
