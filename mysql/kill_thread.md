## 批量kill processlist进程

```mysql
-- 查询锁住的且处理时间超过10秒的进程列表
SELECT id FROM information_schema.processlist WHERE State = 'Locked' AND Time > 10;
```

```mysql
-- 拼接kill语句
SELECT concat('KILL ', id, ';') FROM information_schema.processlist WHERE State = 'Locked' AND Time > 10;
```

```mysql
-- 将kill语句导出为sql文件
SELECT concat('KILL ', id, ';') FROM information_schema.processlist WHERE State = 'Locked' AND Time > 10 INTO OUTFILE '/tmp/kill.sql';
```

```mysql
-- 执行kill语句
SOURCE /tmp/kill.sql
```

## mysqladmin方式
```shell
#!/bin/sh

for id in `mysqladmin -hlocalhost -uadmin -p12345 processlist | grep -i locked | awk '{print $2}'`
do
    mysqladmin kill ${id}
done
```
