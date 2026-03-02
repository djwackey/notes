#! /bin/sh
#
# ## 切分 Nginx 日志 ##
# ### 需求描述 ###
# 1. 定时（每小时）切分 Nginx 日志文件 access.log
# 2. 删除一周之前的所有日志文件
#
# ### 脚本执行 ###
# - 使用 crontab 制作定时任务
# - 执行脚本：sh cut_nginx_log.sh /usr/local/nginx/logs/access.log
#

# get Nginx logs dictionary
nginx_log=$1
echo $nginx_log

function cut_nginx_log()
{
    one_week_ago=`date -d "-7 day" +%Y-%m-%d`
    format_date=`date -d "-1 hour" +%Y-%m-%d-%H`
    cp $nginx_log $nginx_log"."$format_date
    cat /dev/null > $nginx_log
    rm -f $nginx_log"."$one_week_ago
}

cut_nginx_log
