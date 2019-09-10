---
title: Odoo Order
date: 2019-09-10 18:51:28
tags: odoo
categories: odoo
---

# Odoo Order 排序

## 类中的 _order

> `_order`字符串的语法类似于SQL中的`ORDER BY`

```python
class Library(models.Model):
    _name = 'library.book'
    _description = 'Library'
    _order = 'date desc, name'
```

## search()中的 order

> `order=sort_specification` 它用于强制所返回记录集的排序。默认，排序通过模型类的`_order`属性给定

## read_group()中的 order

> `orderby`如果传递了该选项，结果会根据给定字段进行排序