function data = read_avi_data(path)%读入avi视频，获取视频的数据矩阵
warning off all;
avi = aviread(path);
data = {avi.cdata};
end
