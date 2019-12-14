---
title: Python locals()
date: 2019-12-15 00:20:16
categories: python
tags: python
---

## Python locals()

### 命名空间

python中有全局变量和局部变量，python在搜索变量时  
会从命名空间中搜索，命名空间可以分为下面三类：

- 局部命名空间： 函数或类中定义的变量所处的空间
- 全局命名空间： 模块所在的空间
- 内置命名空间： 内置命名空间，全局可用

python查找变量的顺序：局部>全局>内置  
一旦找到相应的变量，即停止查找。

### locals的定义

locals()函数不需要参数，会以字典类型返回当前位置的全部局部变量

```python
def locals_test(demo):
    demo2 = "123"
    print(locals())

if __name__ == "__main__":
    locals_test(2)
# output
# {'demo': 2, 'demo2': '123'}
```
