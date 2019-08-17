---
title: Odoo Form视图添加按钮
date: 2019-08-17 13:47:22
tags: odoo
categories: odoo
---

# Odoo Form视图添加按钮

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