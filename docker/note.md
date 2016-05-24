## Docker官网
https://www.docker.com/

## Docker安装
sudo curl -s https://get.docker.com/ | sudo sh

## 开机自启动
chkconfig docker on

### Docker基本命令

Docker命令|参数说明|功能描述|
-------|-----
docker pull ubuntu:latest||拉取镜像</br>（ubuntu为镜像名称，latest为标签名称）
docker push ubuntu:latest||推送镜像到仓库
docker info||显示镜像信息
docker login [SERVER]||注册或登录到Docker Registry
docker logout||注销登录
docker ps|－a|显示镜像容器进程信息
docker images||显示所有的镜像
docker build .||编译镜像（当前目录下需要有Dockerfile文件）
docker commit CANTAINER [REPOSITORY[:TAG]]||保存镜像改动
docker run -it ubuntu /bin/bash||启动镜像
docker tag IMAGE[:TAG]||为进入仓库的镜像打标签
docker version||显示Docker版本信息
docker volume||管理Docker卷

## Docker三大利器
### 1.docker-machine
创建及管理运行Docker的虚拟机

MacOS
> $ . ~/.docker/start_machine.sh

start_machine.sh脚本内容如下：
<pre>
#!/usr/bin/env bash
# start daemon process

bash --login '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'
</pre>

查看start.sh脚本，大致进行了如下操作：

1.创建虚拟机

2.运行虚拟机

### 2.docker-compose
docker-compose为应用编排工具，取代Fig
#### 安装说明
docker-compose为Python开发的项目，所以
> pip install docker-compose

### 3.docker-swarm


Transaction check error:
  file /usr/lib/systemd/system/blk-availability.service from install of device-mapper-7:1.02.107-5.el7_2.1.x86_64 conflicts with file from package lvm2-7:2.02.105-14.el7.x86_64
  file /usr/sbin/blkdeactivate from install of device-mapper-7:1.02.107-5.el7_2.1.x86_64 conflicts with file from package lvm2-7:2.02.105-14.el7.x86_64
  file /usr/share/man/man8/blkdeactivate.8.gz from install of device-mapper-7:1.02.107-5.el7_2.1.x86_64 conflicts with file from package lvm2-7:2.02.105-14.el7.x86_64

Error Summary
-------------

Reference:
https://github.com/docker/docker/issues/12108
https://bugzilla.redhat.com/show_bug.cgi?id=1207839
