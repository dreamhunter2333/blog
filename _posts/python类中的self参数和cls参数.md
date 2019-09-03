---
title: python类中的self参数和cls参数
date: 2019-09-03 16:41:00
tags: python
categories: python
---

# python类中的self参数和cls参数

> 类先调用__new__方法，返回该类的实例对象  
> 这个实例对象就是__init__方法的第一个参数self，即self是__new__的返回值

```python
class A(object):
    def func1(self):
        print("func1:", self)
    @staticmethod
    def func2():
        print("func2")
    @classmethod
    def func3(cls):
        print("func3:", cls)

a = A()

a.func1()  #  最常见的调用方式，但与下面的方式相同
           #  func1: <__main__.A object at 0x0000014788701EB8>

A.func1(a) #  这里传入实例a，相当于普通方法的self
           #  func1: <__main__.A object at 0x0000014788701EB8>

A.func2()  # 这里，由于静态方法没有参数，故可以不传东西
           # func2:

A.func3()  # 这里，由于是类方法，因此，它的第一个参数为类本身。
           # func3: <class '__main__.A'>

print(A)   # 可以看到，直接打印A，与上面那种调用返回同样的信息。
           # <class '__main__.A'>
```
