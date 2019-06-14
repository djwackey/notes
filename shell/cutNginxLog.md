## 切分Nginx日志 ##
### 需求描述 ###
1. 定时（每小时）切分Nginx日志文件access.log
2. 删除一周之前的所有日志文件

### 代码实现 ###
```shell
#! /bin/sh

# get Nginx logs dictionary
nginx_log=$1
echo $nginx_log

function cut_nginx_log()
{
    one_week_ago=`date -d "-7 day" +%Y-%m-%d`
    format_date=`date -d "-1 hour" +%Y-%m-%d-%H`
    cp $nginx_log $nginx_log"."$format_date
    cat /dev/null > $nginx_log
    rm -f $nginx_log"."$one_day_ago
}

cut_nginx_log
```

### 脚本执行 ###
- 使用crontab制作定时任务
- 执行脚本：
```shell
sh cutnginxlog.sh /usr/local/nginx/logs/access.log
```
