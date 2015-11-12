下载源码
<pre>
wget https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tar.xz
</pre>
解压文件
<pre>
xz Python-2.7.10.tar.xz
tar -xf Python-2.7.10.tar
</pre>
编译/安装
<pre>
./configure --prefix=/usr/local/python2.7
make && make install
</pre>
安装easy_install
<pre>
Unix: wget https://bootstrap.pypa.io/ez_setup.py -O - | python
Mac OS: curl https://bootstrap.pypa.io/ez_setup.py -o - | python
</pre>
安装pip
<pre>
sudo easy_install pip
</pre>
