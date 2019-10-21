## Flask源代码分析
### 本文目录

[TOC]



### 文件目录结构
```
.
├── json
|   ├── __init__.py
|   └── tag.py
├── __init__.py
├── __main__.py
├── _compat.py
├── app.py
├── blueprints.py
├── cli.py
├── config.py
├── ctx.py
├── debughelpers.py
├── globals.py
├── helpers.py
├── logging.py
├── sessions.py
├── signals.py
├── templating.py
├── testing.py
├── views.py
└── wrappers.py
```

### 文件功能描述

| 文件/目录 | 描述 |
| :-----: | :-----: |
| json | json操作 |
| \___init___.py | FLASK模块包的标识文件，包含FLASK框架的版本号及导出的模块等 |
| \___main\___.py | 入口 |
| _compat.py | 兼容 |
| blueprints.py | 蓝图 |
| cli.py | 命令行 |
| config.py | 配置 |
| ctx.py | 上下文 |
| debughelpers.py | 调试助手 |
| globals.py | 全局 |
| helpers.py | 助手 |
| logging.py | 日志 |
| sessions.py | 会话 |
| signals.py | 信号 |
| templating.py | 模板 |
| testing.py | 测试 |
| views.py | 视图 |
| wrappers.py | 该模块封装了请求和响应类，主要负责数据的请求和响应功能 |

### Hello World应用程序
```python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'
```

### 主要类介绍

一.Flask类

成员变量: request_class

    类型: Request
    导入: from .wrappers import Request
    父类: from werkzeug.wrappers import Request
    说明: 请求类

成员变量: response_class

    类型: Response
    导入: from .wrappers import Response
    父类: from werkzeug.wrappers import Response
    说明: 响应类

成员变量: jinja_environment

    类型: Environment
    导入: from .templating import Environment
    说明: Jinja环境类

成员变量: app_ctx_globals_class

    类型: _AppCtxGlobals


成员函数: route

    参数:
        rule - URL规则字符串
        option - 可选参数
        endpoint - 注册的URL规则作为结点
    说明: 装饰器函数，使用URL规则参数，注册一个视图函数

二.Config类

Config类继承自字典dict，有5中加载数据的方式

```python
# 1.从环境变量中，加载配置
app.config.from_envvar

# 2.从Python文件中，加载配置
app.config.from_pyfile

# 3.从对象中，加载配置，对象可以是字符串，也可以是实际对象的引用
app.config.from_object

# 4.从字典中，加载配置
app.config.from_mapping

# 5.从JSON文件中，加载配置
app.config.from_json
```
