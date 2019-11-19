计算文件第三列数值总数
```shell
> awk '{x += $3} END {print x}' [file_name]
```

计算目录中文件行数
```shell
find . -name "*.c" | xargs cat | grep -v ^$ | wc -l
```
