---
title: Odoo one2many many2many 写值规则
date: 2019-08-21 14:56:14
tags:
    - odoo
    - one2many
    - many2many
categories: odoo
---

## Odoo one2many many2many 写值规则

odoo12以后one2many many2many 写值规则基本相同

```bash
# many2many
# 根据values里面的信息新建一个记录。
(0,0,{values}) 
# 更新id=ID的记录（写入values里面的数据）
(1,ID,{values})
# 删除id=ID的数据（调用unlink方法，删除数据以及整个主从数据链接关系）
(2,ID)
# 切断主从数据的链接关系但是不删除这个数据
(3,ID)
# 为id=ID的数据添加主从链接关系。
(4,ID)
# 删除所有的从数据的链接关系就是向所有的从数据调用(3,ID)
(5)
# 用IDs里面的记录替换原来的记录（就是先执行(5)再执行循环IDs执行（4,ID））
(6,0,[IDs])
```
