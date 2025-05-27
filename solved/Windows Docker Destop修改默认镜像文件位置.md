# Windows Docker Desktop修改默认镜像文件位置

0.首先关闭docker desktop.
1.通过资源管理器找到以.vhdx结尾的文件所在的位置，这些就是docker镜像路径
2.我的路径：C:\Users\Administrator\AppData\Local\Docker\wsl\data
2.将路径下的ext4.vhdx复制一份到D:\docker\data（该目录自己创建就行）下
3.删除C:\Users\Administrator\AppData\Local\Docker\wsl\中下的data目录及ext4.vhdx
4.做硬连接，需要以管理员方式启动cmd命令行
5.输入以下命令mklink /J C:\Users\Administrator\AppData\Local\Docker\wsl\data D:\docker\data
6.重新打开docker
