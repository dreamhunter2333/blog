---
title: Odoo Form视图添加按钮和状态条
date: 2019-08-15 13:47:22
tags: odoo
categories: odoo
---

# Odoo Form视图添加按钮和状态条

## button 参数

- type：可以被定义为三个值
  - workflow：表示为点击按钮的时候，发送name属性定义的信号来激活工作流（type的默认值）
  - object：表示点击按钮后，激活一个自定义的Python函数，函数名称使用name属性定义
  - action：表示点击按钮之后，激活一个动作(action)，行为类似于一个菜单name设定为%(action_id)d的方式
- special：只有一个可选之cancel，表示点击之后关闭当前画面，不做任何动作（special和name是互斥的，只能存在一个）
- name：name中定义的值都是和type相关，是一个信号、函数名称或者是一个动作（使用特殊写法`%(action_id)d`）
- confirm：点击按钮之后弹出一个消息框
- string：按钮在界面上的显示名称
- icon：按钮的显示图标


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

> 可以直接使用res_id指定单独的一个id来返回一个form视图  
> `(‘view_mode’: ‘form’)`  
> 或者指定一个domain来返回list视图  
> `(‘view_mode’: ‘tree’)`

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

> `states=xx`: 当`state`不为`states`的值时该模块被隐藏

```python
# 定义状态字段
state = fields.Selection([('draft', '草稿'), ('rent', '借出'), ('return', '归还')], default='draft', string="状态")
```
```xml
<!-- 添加状态条 -->
<header>
    <button name="rent_book" type="object" string="借书" class="oe_highlight" states="draft"/>
    <field name="state" widget="statusbar" statusbar_visible="draft,rent,return"/>
</header>
```