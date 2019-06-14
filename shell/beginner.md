脚本行首
```shell
> #! /usr/bin/env bash
```

if 语法
```shell
# first argument equal "fmt"
if [ "$1" = "fmt" ]; then
fi

# container folder
if [ ! -f make.sh ]; then
    echo 'make.sh must be run within its container folder' 1>&2
    exit 1
fi
```

case 语法
```shell
case $1 in
    weixin) python manage.py runserver 0.0.0.0:6001 --settings apps.weixin.settings;;
    admin) python manage.py runserver 0.0.0.0:7001 --settings apps.admin.settings;;
    uweb) python manage.py runserver 0.0.0.0:8001 --settings apps.uweb.settings;;
esac
```

export 语法
```shell
CUR_DIR=`pwd`
OLD_GOPATH="$GOPATH"
export GOPATH=$OLD_GOPATH:"$CUR_DIR"
```

echo 语法
```shell
# 打印当前日期时间
echo "$(date)"
```

awk 语法
```shell
awk '{print $2}'
```