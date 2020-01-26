---
title: SQL 基本语句
date: 2019-08-19 00:12:24
tags: SQL
categories: odoo
---

# SQL 基本语句

## SQL SELECT 语句

```sql
-- 查询某些列
SELECT column_name,column_name
FROM table_name;
-- 查询所有列
SELECT * FROM table_name;
-- 只列出查询的结果不同（distinct）的记录。
SELECT DISTINCT column_name,column_name
FROM table_name;
```

## SQL WHERE 语句 AND OR 运算符

```sql
-- where: 提取满足条件的记录
SELECT column_name,column_name 
FROM table_name 
WHERE column_name operator value;
```

> WHERE后的条件可以使用 AND OR 运算符
> where后的语句运算符

运算符  | 功能
-------|:-----:
=      |等于
<>     |不等于。注释：在 SQL 的一些版本中，该操作符可被写成 !=
>      |大于
<      |小于
>=     |大于等于
<=     |小于等于
BETWEEN|在某个范围内
LIKE   |搜索某种模式
IN     |指定针对某个列的多个可能值

## SQL ORDER BY 关键字

```sql
-- 按ORDER BY后面列的升序(降序)排列
SELECT column_name,column_name
FROM table_name
ORDER BY column_name,column_name ASC|DESC;
```

## SQL INSERT INTO 语句

```sql
-- 第一种形式无需指定要插入数据的列名，只需提供被插入的值即可：
INSERT INTO table_name 
VALUES (value1,value2,value3,...);
-- 第二种形式需要指定列名及被插入的值：
INSERT INTO table_name (column1,column2,column3,...) 
VALUES (value1,value2,value3,...);
```

## SQL UPDATE 语句

```sql
UPDATE table_name
SET column1=value1,column2=value2,...
WHERE some_column=some_value;
```

## SQL DELETE 语句

```sql
DELETE FROM table_name
WHERE some_column=some_value;
```