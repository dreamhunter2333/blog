---
title: Odoo many2one隐藏创建选项many2many不弹出编辑框
date: 2019-08-22 14:22:20
tags: 
    - odoo
    - many2one
    - many2many
categories: odoo
---

# Odoo many2one隐藏创建选项many2many不弹出编辑框

## many2one 隐藏创建选项

```xml
<!-- no_create_edit: 隐藏创建与编辑 -->
<!-- no_create：隐藏输入文字时的创建 -->
<field name="demo" options="{'no_create_edit':True,'no_create':True}"/>
```
## many2many 点击添加项目不弹窗只增加一行

> 在tree视图上加:`editable="bottom"`  
> 如果没有添加项目按钮，可以使用`editable="top"`