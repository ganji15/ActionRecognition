function data = read_avi_data(path)%����avi��Ƶ����ȡ��Ƶ�����ݾ���
warning off all;
avi = aviread(path);
data = {avi.cdata};
end
