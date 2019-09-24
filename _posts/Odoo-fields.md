---
title: Odoo fields的基本字段
date: 2019-08-17 10:45:57
tags: odoo
categories: odoo
---

# fields的基本字段

## 基本字段

- 文本
  - Char
  - Text

- 数值
  - Integer
  - Float ( `@digits` 控制精度 )

- Boolean 布尔值

- 时间
  - Date
  - Datetime

- Selection

- 关系
  - One2many
  - Many2many
  - Many2one

## 字段通用属性

```python
# 必填
required=True
# 只读
readonly=True
# 保存到数据库
store=True
# 默认值
default=xxx
# 鼠标停留显示
help="xxx"
# 特殊字段state不是states的值时隐藏
states="xxx"
```

## 关系字段

> ondelete关联的记录被删除时，对当前记录的操作

```python
r_id = fields.One2many('l.r', 'r_ids', ondelete='set null')
write_ids = fields.Many2many('l.l', ondelete='set null')
r_ids = fields.Many2one('l.p', ondelete='set null')
```
