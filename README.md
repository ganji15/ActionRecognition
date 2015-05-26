# ActionRecognition

##1. 如何找到视频样本
访问网站[Actions as Space-Time Shapes](http://www.wisdom.weizmann.ac.il/~vision/SpaceTimeActions.html)，本程序训练了四种动作：“走”，“跑”，“跳”，“弯腰”。请下载相应的视频数据库。
##2. 动作训练阶段
将数据库放入正确位置（请参考ActionTrain.m代码，程序默认路径为“D:/database/”）,然后运行训练模块ActionTrain.m，生成训练数据结构mat.mat四维矩阵。
##3. 动作识别阶段
请运行run.m,run.m文件中可以输入训练目标文件夹。

###注意
请用matlab2014运行。
