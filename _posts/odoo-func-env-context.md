---
title: odoo func env.context
date: 2019-12-01 22:05:26
categories: odoo
tags: odoo
---

## odoo func env.context

context 中内容会在下次前端触发后重置

### 获取 context 内容

```python
self.env.context.get('demo'):
```

### 增加 context 内容

```python
context = dict(self.env.context, demo=True)
self.env = self.env(context=context)
```

### with_context 内容 运行对象的某个函数

```python
self.with_context(demo=True).demo_func()
```
