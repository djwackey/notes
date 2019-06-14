安装pyenv
```shell
# pyenv是一个Python版本管理工具
$ git clone git://github.com/yyuu/pyenv.git ~/.pyenv
$ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
$ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
$ echo 'eval "$(pyenv init -)"' >> ~/.bashrc
```

安装Python
<pre>
安装必须软件
$ sudo yum install -y gcc libffi-devel python-devel openssl-devel

查看可安装版本
$ pyenv install --list
$ pyenv install 3.4.3

设置全局Python版本
$ pyenv global 3.4.3
$ pyenv versions
system
* 3.4.3 (set by /home/cic/.pyenv/version)

确认Python版本
$ python
Python 3.4.3 (default, Sep 10 2014, 17:10:18)
[GCC 4.4.7 20120313 (Red Hat 4.4.7-1)] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>

升级pip
$ pip install --upgrade pip
</pre>

安装MySQLdb
```
MySQLdb不支持Python3.x版本
$ pip install mysqlclient

MySQL DB API Drivers¶
The Python Database API is described in  PEP 249. MySQL has three prominent drivers that implement this API:
MySQLdb is a native driver that has been developed and supported for over a decade by Andy Dustman.
mysqlclient is a fork of MySQLdb which notably supports Python 3 and can be used as a drop-in replacement for MySQLdb. At the time of this writing, this is the recommended choice for using MySQL with Django.
MySQL Connector/Python is a pure Python driver from Oracle that does not require the MySQL client library or any Python modules outside the standard library.

All these drivers are thread-safe and provide connection pooling. MySQLdb is the only one not supporting Python 3 currently.
```
