计算文件第三列数值总数
> awk '{x += $3} END {print x}' [file_name]
