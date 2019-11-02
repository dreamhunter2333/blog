---
title: Python sorted()
date: 2019-11-03 00:10:34
categories: 
    - [python]
    - [odoo]
tags: 
    - [python]
    - [odoo]
---

## Python3 sorted() 函数

### sorted() 函数对所有可迭代的对象进行排序操作

```python
# iterable -- 可迭代对象。
# key -- 主要是用来进行比较的元素，只有一个参数，具体的函数的参数就是取自于可迭代对象中，指定可迭代对象中的一个元素来进行排序。
# reverse -- 排序规则，reverse = True 降序 ， reverse = False 升序（默认）。
sorted(iterable, key=None, reverse=False)  
```

### 返回重新排序的列表

```python
>>>sorted({1: 'D', 2: 'B', 3: 'B', 4: 'E', 5: 'A'})
[1, 2, 3, 4, 5]
```

### odoo 中重新排序列表

```python
demo = self.sorted(key=lambda r: r.sequence)
demo = sorted(self.items(), key=lambda r: r.sequence)
```
