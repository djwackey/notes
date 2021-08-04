# Docker常用命令

## 镜像操作
### 删除所有镜像
```shell
docker rmi $(docker images -q)
```

## 容器操作
### 列出所有的容器ID
```shell
docker ps -aq
```

### 停止所有容器
```shell
docker stop $(docker ps -aq)
```

### 删除所有容器
```shell
docker rm $(docker ps -aq)
```
