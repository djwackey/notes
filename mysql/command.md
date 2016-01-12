增加root密码
mysqladmin -uroot -password 12345

修改root密码
mysqladmin -uroot -p12345 password 67890

创建用户
grant [priv1], [priv2],... [privN] on [database].[table] to [username]@[address] identified by [password]
GRANT ALL PRIVILEGES ON *.* TO cic@"%" IDENTIFIED BY "Hkhl2015"

刷新权限
flush privileges

连接数据库（默认选中db_test数据库）
mysql -h127.0.0.1 -uroot -p12345 db_test

显示所有数据库
show databases;

创建数据库
create database db_test;

删除数据库
drop database db_test;

选择数据库
use db_test

显示所有数据表
show tables

设置字符集
set charset utf8;

添加列
alter table t_user add column name varchar(64) not null;

删除列　
alter table t_user drop column name;

修改表名
alter table t_user rename to t_new_user;

显示状态列表
show processlist;

显示创建表
show create table t_user;
