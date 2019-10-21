---
title: SQL NULL Func
date: 2019-10-21 15:05:58
categories: sql
tags: sql
---

## SQL NULL 函数

将 `null` 替换为某个值

### ISNULL()

* SQL Server / MS Access

```sql
SELECT ISNULL(demo,0))
FROM demo
```

### NVL()

* Oracle

```sql
SELECT NVL(demo,0))
FROM demo
```

### IFNULL()

* Mysql

```sql
SELECT IFNULL(demo,0))
FROM demo
```

### COALESCE()

* Mysql/Pgsql

```sql
SELECT COALESCE(demo,0))
FROM demo
```
