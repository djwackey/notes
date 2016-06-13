### 编译Golang1.6.2源码
由于Golang1.6.2底层由Go实现,因此编译Golang1.6.2需要Golang1.4.2支持.

1.安装基本编译组件
```
sudo apt-get install build-essential
```

2.下载Golang1.4.2源码
```
wget http://www.golangtc.com/static/go/1.4.2/go1.4.2.src.tar.gz
```

3.编译Golang1.4.2源码
```
tar -xvf go1.4.2.src.tar.gz
cd go/src && ./all.bash
```

4.配置Golang1.4.2环境变量
```
```

5.下载Golang1.6.2源码
```
wget http://www.golangtc.com/static/go/1.6.2/go1.6.2.src.tar.gz
```

6.编译Golang1.6.2源码
```
tar -xvf go1.6.2.src.tar.gz
cd go/src && ./all.bash
```
