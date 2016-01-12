增加root密码
<pre>
mysqladmin -uroot -password 12345
</pre>

修改root密码
<pre>
mysqladmin -uroot -p12345 password 67890
</pre>

创建用户
<pre>
grant [priv1], [priv2],... [privN] on [database].[table] to [username]@[address] identified by [password]
GRANT ALL PRIVILEGES ON *.* TO cic@"%" IDENTIFIED BY "Hkhl2015"
</pre>

刷新权限
<pre>
flush privileges
</pre>

连接数据库（默认选中db_test数据库）
<pre>
mysql -h127.0.0.1 -uroot -p12345 db_test
</pre>

显示所有数据库
<pre>
show databases;
</pre>

创建数据库
<pre>
create database db_test;
</pre>

删除数据库
<pre>
drop database db_test;
</pre>

选择数据库
<pre>
use db_test
</pre>

显示所有数据表
<pre>
show tables
</pre>

设置字符集
<pre>
set charset utf8;
</pre>

添加列
<pre>
alter table t_user add column name varchar(64) not null;
</pre>

删除列　
<pre>
alter table t_user drop column name;
</pre>

修改表名
<pre>
alter table t_user rename to t_new_user;
</pre>

显示状态列表
<pre>
show processlist;
</pre>

显示创建表
<pre>
show create table t_user;
</pre>
