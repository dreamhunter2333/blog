---
title: Odoo Domain 波兰表示法
date: 2019-08-17 14:34:19
tags: odoo
categories: odoo
---

# Odoo Domain 波兰表示法

## domain表达式

### 常见表达式

> Domain是个多条件的列表，每个条件是一个三元表达式：[(字段名，操作符，值), (字段名，操作符，值)]
[('create_id','=',user.id)]

### Domain使用场合

* `python` 函数中的过滤器
* `tree` `form` 视图的过滤器

### Domain操作符

操作符|功能
--|:--:
=|比较运算 等于
!=|比较运算 不等于
>|比较运算 大于
>=|比较运算 大于等于
<|比较运算 小于
<=|比较运算 小于等于
in|包含，判断值是否在元素的列表里面
not in| 不包含，判断值是否不在元素的列表里面