---
title: What’s New In Python 3.8
date: 2020-01-14 23:40:59
categories: python
tags: python
---

## What’s New In Python 3.8

[原文](https://docs.python.org/zh-cn/3/whatsnew/3.8.html)

### 赋值表达式

新增的语法 `:=` 可在表达式内部为变量赋值。 它被昵称为“海象运算符”.

在这个示例中，赋值表达式可以避免调用 len() 两次:

```python
if (n := len(a)) > 10:
    print(f"List is too long ({n} elements, expected <= 10)")
```

类似的益处还可出现在正则表达式匹配中需要使用两次匹配对象的情况中，  
一次检测用于匹配是否发生，另一次用于提取子分组:

```python
discount = 0.0
if (mo := re.search(r'(\d+)% discount', advertisement)):
    discount = float(mo.group(1)) / 100.0
```

此运算符也适用于配合 while 循环计算一个值来检测循环是否终止，  
而同一个值又在循环体中再次被使用的情况:

```python
while (block := f.read(256)) != '':
    process(block)
```

另一个值得介绍的用例出现于列表推导式中，在筛选条件中计算一个值，  
而同一个值又在表达式中需要被使用:

```python
[clean_name.title() for name in names
 if (clean_name := normalize('NFC', name)) in allowed_names]
```

## 仅限位置形参 `/`

在下面的例子中，形参 a 和 b 为仅限位置形参，  
c 或 d 可以是位置形参或关键字形参，而 e 或 f 要求为关键字形参:

```python
def f(a, b, /, c, d, *, e, f):
    print(a, b, c, d, e, f)
# 以下均为合法的调用:
f(10, 20, 30, d=40, e=50, f=60)
# 但是，以下均为不合法的调用:
f(10, b=20, c=30, d=40, e=50, f=60)   # b cannot be a keyword argument
f(10, 20, 30, 40, 50, f=60)           # e must be a keyword argument
```

这种标记形式的一个用例是它允许纯 Python 函数完整模拟现有的  
用 C 代码编写的函数的行为。 例如，内置的 pow() 函数不接受关键字参数:

```python
def pow(x, y, z=None, /):
    "Emulate the built in pow() function"
    r = x ** y
    return r if z is None else r%z
另一个用例是在不需要形参名称时排除关键字参数。 例如，内置的 len() 函数的签名为 len(obj, /)。 这可以排除如下这种笨拙的调用形式:

len(obj='hello')  # The "obj" keyword argument impairs readability
```

另一个益处是将形参标记为仅限位置形参将允许在未来修改形参名而不会破坏客户的代码。  
例如，在 statistics 模块中，形参名 dist 在未来可能被修改。  
这使得以下函数描述成为可能:

```python
def quantiles(dist, /, *, n=4, method='exclusive')
    ...
```

由于在 / 左侧的形参不会被公开为可用关键字，其他形参名仍可在 **kwargs 中使用:

```python
>>>
>>> def f(a, b, /, **kwargs):
...     print(a, b, kwargs)
...
>>> f(10, 20, a=1, b=2, c=3)         # a and b are used in two ways
10 20 {'a': 1, 'b': 2, 'c': 3}
# 这极大地简化了需要接受任意关键字参数的函数和方法的实现。 例如，以下是一段摘自 collections 模块的代码:

class Counter(dict):

    def __init__(self, iterable=None, /, **kwds):
        # Note "iterable" is a possible keyword argument
```
