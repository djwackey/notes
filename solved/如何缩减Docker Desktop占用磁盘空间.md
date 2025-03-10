## 如何缩减Docker Desktop占用磁盘空间

在Windows10中使用Docker Desktop时，有一个问题就是磁盘占用一直增长，即使删除镜像但还是占用着磁盘空间。这是因为因为 windows 中的 docker desktop 使用虚拟磁盘（VHDX）来存储文件系统。Windows中，docker运行在WSL2上，而WSL2使用虚拟磁盘 (VHDX) 来存储文件系统，VHDX并不会自动。

这意味着您删除了一些镜像后，降低了Docker所需要空间到20G，而虚拟磁盘仍然占用100GB的情况。这时我们可以通过diskpart命令手工对虚拟磁盘进行收缩。

压缩前：
1.确保 WSL2 没有运行

检查它是否正在运行：wsl --list --verbose

PS C:\WINDOWS\system32> wsl --list --verbose

NAME STATE VERSION
docker-desktop-data Stopped 2
docker-desktop Stopped 2
如果在运行可以通过以下命令进行停止。
wsl --terminate docker-desktop
wsl --terminate docker-desktop-data

2.启动diskpart收缩磁盘
启动diskpart
PS C:\WINDOWS\system32> diskpart

Microsoft DiskPart 版本 10.0.19041.964

Copyright (C) Microsoft Corporation.
在计算机上: DESKTOP-2MQJC0A

指定文件
DISKPART> select vdisk file="C:\Users\Admin\AppData\Local\Docker\wsl\data\ext4.vhdx"

DiskPart 已成功选择虚拟磁盘文件。

压缩
DISKPART> compact vdisk

100 百分比已完成

DiskPart 已成功压缩虚拟磁盘文件。

完成
DISKPART> detach vdisk

虚拟磁盘已经分离。

DISKPART> exit

退出 DiskPart...

对比发现占用磁盘空间已经缩减。
