---
title: Odoo视图xml invisible属性
date: 2019-08-19 22:32:00
tags: odoo
categories: odoo
---

#  Odoo视图invisible属性

## xml标签的属性

- string：字段显示名称
- password：设置本字段以*号显示
- nolabel：是否显示string定义的标签名
- colspan：列宽
- col：本字段占用的列宽
- default_focus：被字段是否获得默认焦点
- states：指定state字段处于什么状态该状态可见
- domain：在关联字段中过滤对象
- eval：通过一个简单的Python表达式来计算值
- required：该字段是否必输
- readonly：该字段是否只读
- invisible：该字段是否隐藏
- widget：本字段是否使用特殊的控件显示(many2many_tags,many2many_list,statusbar……)
- attrs：使用一个domain条件来控制
- on_change：指定一个函数来定义当该值改变的时候发生的行为


## 固定值隐藏

```xml
invisible="1"
```

## 触发某个条件时隐藏

> attrs字典内部的domain属性可以使用一个简单的python表达式来指定


```xml
attrs="{'invisible': [('is_who', '=', 2)]}
```

## states active特殊字段隐藏

```python
states="draft"
active=False
```
