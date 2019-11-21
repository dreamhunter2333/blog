---
title: Python3 mro __class__
date: 2019-11-21 23:20:00
categories: python
tags: python
---

## Python3 的 mro super

通过 super 可以调用父类的方法
其中 `self.__class__.mro()` 从第一个类方法被调用时就确定了
而 `__class__.mro()` 则当前类方法被调用时才确定

所以指定调用 `MRO` 列表中某个类方法的时候可以使用 `__class__.mro()[2].m(self)` 的形式

```python
class A:
    def m(self):
        print('------A------')
        print(__class__.mro())
        print(self.__class__.mro())
        print('------A------')


class B(A):
    def m(self):
        print('------B------')
        super(B, self).m()
        print(__class__.mro())
        print(self.__class__.mro())
        print('------B------')


class C(B):
    def m(self):
        print('------C------')
        super(C, self).m()
        print(__class__.mro())
        print(self.__class__.mro())
        print('------C------')

    def m2(self):
        print('------C------')
        print(__class__.mro())
        print(self.__class__.mro())
        # C 中要想直接调用 A 的方法，如下
        __class__.mro()[2].m(self)
        print('------C------')

B().m()
"""
    结果如下
    ------B------
    ------A------
    [<class '__main__.A'>, <class 'object'>]
    [<class '__main__.B'>, <class '__main__.A'>, <class 'object'>]
    ------A------
    [<class '__main__.B'>, <class '__main__.A'>, <class 'object'>]
    [<class '__main__.B'>, <class '__main__.A'>, <class 'object'>]
    ------B------
"""
C().m()
"""
    结果如下
    ------C------
    ------B------
    ------A------
    [<class '__main__.A'>, <class 'object'>]
    [<class '__main__.C'>, <class '__main__.B'>, <class '__main__.A'>, <class 'object'>]
    ------A------
    [<class '__main__.B'>, <class '__main__.A'>, <class 'object'>]
    [<class '__main__.C'>, <class '__main__.B'>, <class '__main__.A'>, <class 'object'>]
    ------B------
    [<class '__main__.C'>, <class '__main__.B'>, <class '__main__.A'>, <class 'object'>]
    [<class '__main__.C'>, <class '__main__.B'>, <class '__main__.A'>, <class 'object'>]
    ------C------
"""

C().m2()
"""
    调用结果
    ------C------
    [<class '__main__.C'>, <class '__main__.B'>, <class '__main__.A'>, <class 'object'>]
    [<class '__main__.C'>, <class '__main__.B'>, <class '__main__.A'>, <class 'object'>]
    ------A------
    [<class '__main__.A'>, <class 'object'>]
    [<class '__main__.C'>, <class '__main__.B'>, <class '__main__.A'>, <class 'object'>]
    ------A------
    ------C------
"""
```
