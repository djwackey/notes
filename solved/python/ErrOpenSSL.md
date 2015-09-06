20150828

今天在做苹果支付订单验证的时候，出现了问题：
<pre>
/usr/local/lib/python2.7/dist-packages/requests/packages/urllib3/util/ssl_.py:79: 
          InsecurePlatformWarning: A true SSLContext object is not available. 
          This prevents urllib3 from configuring SSL appropriately and may cause certain SSL connections to fail. 
          For more information, see https://urllib3.readthedocs.org/en/latest/security.html#insecureplatformwarning.
  InsecurePlatformWarning
</pre>
Python版本：2.7.3

经过确认，发现是requests库的问题，因为苹果订单验证是通过GET https来验证的，也就是使用了SSL协议，服务器日志报上面的警告，于是上网搜了一下，发现这篇文档特别有用：
http://stackoverflow.com/questions/29134512/insecureplatformwarning-a-true-sslcontext-object-is-not-available-this-prevent

我们的服务器使用的是CentOS，直接安装下面软件，即可解决问题：
<pre>
pip install pyopenssl ndg-httpsclient pyasn1
</pre>
如果是ubuntu系统的话，使用以下命令：
<pre>
apt-get install libffi-dev libssl-dev
</pre>

另外的解决方案是：

有人说升级python至2.7.9版本即可解决问题，若不想升级的话，降低你的requests版本至2.5.3
<pre>
sudo pip install requests==2.5.3
</pre>
