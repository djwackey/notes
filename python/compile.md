下载源码
```shell
wget https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tar.xz
```

解压文件
```shell
xz Python-2.7.10.tar.xz
tar -xf Python-2.7.10.tar
```

编译/安装
```shell
./configure --prefix=/usr/local/python2.7
make && make install
```

安装easy_install
```shell
Unix: wget https://bootstrap.pypa.io/ez_setup.py -O - | python
Mac OS: curl https://bootstrap.pypa.io/ez_setup.py -o - | python
```

安装pip
```shell
sudo easy_install pip
```