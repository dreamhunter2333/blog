---
title: Odoo视图invisible属性
date: 2019-08-19 22:32:00
tags: odoo
categories: odoo
---

#  Odoo视图invisible属性

## 固定值隐藏

```xml
invisible="1"
```

## 触发某个条件时隐藏

```xml
attrs="{'invisible': [('is_who', '=', 2)]}
```

## states active特殊字段隐藏

```python
states="draft"
active=False
```
