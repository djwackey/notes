1.写出以下表达式的结果：
```
1.
from __future__ import unicode_literals, division

5 / 2

# result: 2.5
# explain:
# ------------------------------------------
# from __future__ import unicode_literals
# 在python2.x中使用python3.x的特性
# ------------------------------------------
# from __future__ import division
# python2.x版本中，实现5 / 2 = 2.5
# ------------------------------------------

2.
1 and [""] or "False"

# result: ['']

3.bytearray("0")[0]

# result: 48

4. [item != 3 and item or -1 for item in [0, 1, 2, 3]]

# result: [-1, 1, 2, -1]
```

2.以下的代码的输入将是什么？
```
class Parent(object):
    x = 1

class Child1(Parent):
    pass

class Child2(Parent):
    pass

print Parent.x, Child1.x, Child2.x
Child1.x = 2
print Parent.x, Child1.x, Child2.x
Parent.x = 3
print Parent.x, Child1.x, Child2.x

# result:
(1, 1, 1)
(1, 2, 1)
(3, 2, 3)
```

3.以下的代码的输出将是什么？
```
def multipliers():
    return [lambda x : i * x for i in range(4)]

print [m(2) for m in multipliers()]

# result: [6, 6, 6, 6]
# explain:
#
# Python闭包的后期绑定导致的late binding
def multipliers():
    return [lambda x, i = i:i * x for i in range(4)]
```

4.Python里面search()和match()的区别？
```
match()函数只检测RE是不是在string的开始位置匹配，也就是说match()只有在0位置匹配成功的话，才有返回，如果不是开始位置匹配成功的话，match()就返回none
search()会扫描整个string查找匹配项
```

5.Python如何实现单例模式？
```
class Singleton(type):
    def __init__(cls, name, bases, dict):
        super(Singleton, cls).__init__(name, bases, dict)
        cls._instance = None

    def __call__(cls, *args, **kw):
      if cls._instance is None:
          cls._instance = super(Singleton, cls).__call__(*args, **kw)
      return cls._instance

class MyClass(object):
    __metaclass__ = Singleton

one = MyClass()
two = MyClass()
```

6.实现一个带参数的函数装饰器deco
```
def dec(debug):
    def _dec(func):
        print("debug mode:", debug)
        def wapped(*args, **kwargs):
            return func(*args, **kwargs)
        return wapped
    return _dec

@deco(debug=True)
def func(a, b):
    pass
```

7.以下代码将输出什么？
```
l = ['a', 'b', 'c', 'd', 'e']
print l[10:]

# result: []
# explain: 以上代码不会导致IndexError异常发生
```

8.以下代码的输出将是什么？说出你的答案并解释？
```
def extendList(val, list=[]):
    list.append(val)
    return list

list1 = extendList(10)
list2 = extendList(123, [])
list3 = extendList('a')

print "list1 = %s" % list1
print "list2 = %s" % list2
print "list3 = %s" % list3

# result:
list1 = [10, 'a']
list2 = [123]
list3 = [10, 'a']
# explain:
# list1和list3操作的是相同的列表
# list2操作的是它创建的独立的列表
# 如下修改：
def extendList(val, list=None):
    if list is None:
        list = []
    list.append(val)
    return list
```
