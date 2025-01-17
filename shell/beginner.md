### 脚本行首
```shell
> #! /usr/bin/env bash
```

### if 语法
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

### case 语法
```shell
case $1 in
    weixin) python manage.py runserver 0.0.0.0:6001 --settings apps.weixin.settings;;
    admin) python manage.py runserver 0.0.0.0:7001 --settings apps.admin.settings;;
    uweb) python manage.py runserver 0.0.0.0:8001 --settings apps.uweb.settings;;
esac
```

### export 语法
```shell
CUR_DIR=`pwd`
OLD_GOPATH="$GOPATH"
export GOPATH=$OLD_GOPATH:"$CUR_DIR"
```

### echo 语法
```shell
# 打印当前日期时间
echo "$(date)"
```

### awk 语法
```shell
awk '{print $2}'
```

### 替换多个文件的字符串
```shell
find . -type f -name "*.py" -exec sed -i 's/from appbuilder/from app.appbuilder/g' {} +
```

### 生成Python脚本文件
```shell
echo 'import asyncio
from openai import AsyncOpenAI


async def main():
    # https://pypi.org/project/openai/
    base_url = "http://127.0.0.1:8080/v1"
    api_key = "any"
    client = AsyncOpenAI(
        api_key=api_key,
        base_url=base_url
    )
    completion = await client.chat.completions.create(
        model="ERNIE-Bot-4",
        stream=True,
        top_p=0.99,
        max_tokens=1024,
        temperature=0.55,
        messages=[
            {"role": "system", "content": "Assistant is a large language model."},
            {"role": "user", "content": "你是什么大模型？"}
        ]
    )
    print(completion)
    async for chunk in completion:
        print(chunk)
        print(chunk.choices[0].delta.content)

asyncio.run(main())' > client.py
```
