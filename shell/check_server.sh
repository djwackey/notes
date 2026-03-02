#!/bin/bash

echo "=============================="
echo "服务器资源快速排查 $(date)"
echo "=============================="

echo ""
echo "===== 1. CPU 使用率 TOP10 ====="
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -n 10

echo ""
echo "===== 2. 内存使用率 TOP10 ====="
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 10

echo ""
echo "===== 3. 系统整体资源 ====="
echo "--- uptime ---"
uptime

echo ""
echo "--- free -h ---"
free -h

echo ""
echo "--- CPU Load ---"
cat /proc/loadavg

echo ""
echo "===== 4. 磁盘使用情况 ====="
df -h

echo ""
echo "===== 5. 磁盘 IO 情况 ====="
if command -v iostat >/dev/null 2>&1; then
    iostat -x 1 2
else
    echo "iostat 未安装 (yum install sysstat)"
fi

echo ""
echo "===== 6. 最大目录 (/) ====="
du -h --max-depth=1 / 2>/dev/null | sort -hr | head -n 10

echo ""
echo "===== 7. /var 目录占用 ====="
du -h --max-depth=1 /var 2>/dev/null | sort -hr | head -n 10

echo ""
echo "===== 8. 打开文件最多的进程 ====="
lsof 2>/dev/null | awk '{print $2}' | sort | uniq -c | sort -nr | head

echo ""
echo "===== 9. Docker 资源占用 ====="
if command -v docker >/dev/null 2>&1; then
    docker stats --no-stream
else
    echo "Docker 未安装"
fi

echo ""
echo "===== 10. Docker 磁盘使用 ====="
if command -v docker >/dev/null 2>&1; then
    docker system df
fi

echo ""
echo "===== 11. GPU 使用情况 ====="
if command -v nvidia-smi >/dev/null 2>&1; then
    nvidia-smi
else
    echo "无 NVIDIA GPU"
fi

echo ""
echo "===== 12. 网络连接最多的进程 ====="
ss -antp | awk '{print $6}' | cut -d',' -f2 | cut -d'=' -f2 | sort | uniq -c | sort -nr | head

echo ""
echo "===== 排查完成 ====="
