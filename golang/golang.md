### 编译Golang1.6.2源码
由于Golang1.6.2底层由Go实现,因此编译Golang1.6.2需要Golang1.4.2支持.

1.安装基本编译组件
```shell
sudo apt-get install build-essential
```

2.下载Golang1.4.2源码
```shell
wget http://www.golangtc.com/static/go/1.4.2/go1.4.2.src.tar.gz
```

3.编译Golang1.4.2源码
```shell
tar -xvf go1.4.2.src.tar.gz
cd go/src && ./all.bash
```

4.配置Golang1.4.2环境变量
```shell
export GOROOT_BOOTSTRAP="/home/wackey/project/go1.4"

export GOBIN="/home/wackey/.vim/binaries/bin"
export GOROOT="/home/wackey/project/go1.6"
export PATH="$GOROOT/bin:$PATH"
```

5.下载Golang1.6.2源码
```shell
wget http://www.golangtc.com/static/go/1.6.2/go1.6.2.src.tar.gz
```

6.编译Golang1.6.2源码
```shell
tar -xvf go1.6.2.src.tar.gz
cd go/src && ./all.bash
```