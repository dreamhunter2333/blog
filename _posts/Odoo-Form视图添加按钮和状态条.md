---
title: Odoo Form视图添加按钮和状态条
date: 2019-08-15 13:47:22
tags: odoo
categories: odoo
---

# Odoo Form视图添加按钮和状态条

## xml文件添加`<header>` `<button>`

```xml
<!-- great_person:对应函数名或动作名 -->
<!-- type="object"：button种类 -->
<header>
    <button name="great_person" type="object" string="创建" class="oe_highlight" />
</header>
```
## python文件中添加按钮对应方法

```python
@api.multi
def great_person(self):
    self.write({'name': "测试", 'is_who': 1})
```

## 按钮返回窗口

```python
# target='new'弹出窗口 'current'当前 
@api.model
def re_action(self):
    return dict(
        name='新建',
        type='ir.actions.act_window',
        res_model='library.partner',
        view_type='form',
        view_mode='form',
        target='new',
    )
```

## 使用特殊字段state添加statusbar

> `states=xx` 当`state`不为`states`的值时该模块被隐藏

```python
# 定义状态字段
state = fields.Selection([('draft', '草稿'), ('rent', '借出'), ('return', '归还')], default='draft', string="状态")
```
```xml
<!-- 添加状态条 -->
<header>
    <button name="rent_book" type="object" string="借书" class="oe_highlight" states="draft"/>
    <field name="state" widget="statusbar" statusbar_visible="draft, rent, return"/>
</header>
```