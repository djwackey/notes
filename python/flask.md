## Flask源代码分析
### 本文目录

* 文件目录结构
* 文件功能描述
* Hello World应用程序
* 主要类介绍

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
| \_\_init\_\_.py | FLASK模块包的标识文件，包含FLASK框架的版本号及导出的模块等 |
| \_\_main\_\_.py | 入口 |
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

成员变量:

    request_class
    类型: Request
    导入: from .wrappers import Request
    父类: from werkzeug.wrappers import Request
    说明: 请求类

    response_class
    类型: Response
    导入: from .wrappers import Response
    父类: from werkzeug.wrappers import Response
    说明: 响应类

    jinja_environment
    类型: Environment
    导入: from .templating import Environment
    说明: Jinja环境类

    app_ctx_globals_class
    类型: _AppCtxGlobals


成员函数:

    route
    参数:
        rule - URL规则字符串
        option - 可选参数
        endpoint - 注册的URL规则作为结点
    说明: 装饰器函数，使用URL规则参数，注册一个视图函数，调用add_url_rule方法

    register_blueprint
    参数: 
        blueprints - Blueprints对象
    说明: 通过blueprints对象，调用register方法，注册蓝图。具体见Blueprints类的register方法

    add_url_rule
    参数:
        rule - URL规则
        endpoint - 结点
        view_func - 视图函数


二.Blueprints类

继承父类: _PackageBoundObject

参考代码:

    user = Blueprint("user", __name__)

    @user.route('/user/home', methods=['GET'])
    def user_home():
        return 'success'

    from flask import Flask
    app = Flask(__name__)

    app.register_blueprint(user, url_prefix='/api')

成员变量: 
    
    deferred_functions - 延迟函数列表

成员函数:

    register
    参数: 
        app - Flask对象
    说明: 注册蓝图，调用make_setup_state方法，执行延迟函数，实际调用的是BlueprintSetupState类的add_url_rule方法
    # state为BlueprintSetupState类的对象
    for deferred in self.deferred_functions:
        deferred(state) 

    make_setup_state
    参数:
        app - Flask对象
    说明: 创建蓝图状态对象，之后通过此对象设置add_url_rule回调函数
    返回: BlueprintSetupState对象

    route
    参数:
        rule - URL规则字符串
    说明: 装饰器函数，添加URL规则，实际调用add_url_rule方法

    add_url_rule
    说明: 调用record函数，注册add_url_rule方法
    self.record(lambda s: s.add_url_rule(rule, endpoint, view_func, **options))

    record
    参数: 
        func - add_url_rule函数
    说明: 注册函数
    self.deferred_functions.append(func)


三.BlueprintSetupState类

功能介绍: 保存蓝图状态

成员函数: add_url_rule

    说明: 调用Flask类的add_url_rule方法


四.Config类

继承父类: dict

参考代码:

    # 有5中加载数据的方式，加载完毕，可以通过app.config访问数据。
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


五.MethodView类

继承父类: MethodViewType和View

参考代码:

    class CounterAPI(MethodView):

        def get(self):
            return session.get('counter', 0)

        def post(self):
            session['counter'] = session.get('counter', 0) + 1
            return 'OK'

    app.add_url_rule('/counter', view_func=CounterAPI.as_view('counter'))

成员函数:

    dispatch_request
