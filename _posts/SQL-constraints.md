---
title: SQL 约束
date: 2019-08-20 20:21:48
tags:
  - odoo
  - SQL
categories: odoo
---

# SQL 约束

## SQL 语句 约束

> 约束用于限制加入表的数据的类型。

### SQL UNIQUE 约束

> `UNIQUE` 约束唯一标识数据库表中的每条记录

### SQL CHECK 约束

> `CHECK` 约束用于限制列中的值的范围  
> 如果对单个列定义 CHECK 约束，那么该列只允许特定的值  
> 如果对一个表定义 CHECK 约束，那么此约束会在特定列中对值进行限制。

### SQL NOT NULL 约束

> `NOT NULL` 约束强制列不接受 `NULL` 值  
> `NOT NULL` 约束强制字段始终包含值

### SQL PRIMARY KEY 约束

> PRIMARY KEY 约束唯一标识数据库表中的每条记录  
> 主键必须包含唯一的值。主键列不能包含 NULL 值  

### SQL FOREIGN KEY 约束

> 一个表中的 FOREIGN KEY 指向另一个表中的 PRIMARY KEY  

### SQL DEFAULT 约束

> `DEFAULT` 约束用于向列中插入默认值  
> 如果没有规定其他的值，那么会将默认值添加到所有的新记录

## odoo python 中的 sql 约束

- 内部的基本元素是一个(name, sql_definition, message)的元祖
  - `@name`: 该约束的名称
  - `@sql_definition`: 定义在数据库中的函数
  - `@message`: 如果违反在数据库中的约束，将会显示的消息

```python
_sql_constraints = [('uniq_name', 'unique(name)', 'name must be unique !')]
```
