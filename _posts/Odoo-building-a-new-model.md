---
title: Odoo新建模块
date: 2019-08-14 23:11:37
tags:
    - docker
    - odoo
categories:
    - [odoo]
    - [docker]
---

# Odoo新建模块

## 利用odoo-bin命令新建模块

> 在docker中利用odoo-bin命令新建模块

```bash
# 启动docker中的容器
docker start <CONTAINER ID>

# 进入容器终端(windows cmd 需要在前面加winpty)
docker exec -it <CONTAINER ID> /bin/bash

# 进入容器后终端执行
pyhton3 odoo/odoo-bin scaffold <module name> <where to put it>
```

> 生成的模块如图所示  

![1](/imgs/odoo-model/newmodel.png)

> `__manifest__.py` Odoo模块声明文件  
> `__init__.py`     python模块声明导入  
> `models/*.py`     模型定义文件  
> `views/*.xml`     视图定义文件  
> `data/*.xml`      预置数据文件  
> `security/ir.model.access.csv`: 外部id相关

## __manifest__.py各字段定义

![2](/imgs/odoo-model/manifest.png)

> `name`: 模块名称  
> `depends`: 依赖的模块  
> `data`: 加载的文件  
> `installable`: True 可安装  
> `application`: True 是否为应用  
> `auto_install`: False 是否在依赖都已安装时自动安装

**data中的文件要注意排列顺序

## models中python文件的对象(模型,类,表)、字段

```python
# -*- coding: utf-8 -*-

from odoo import models, fields, api


class Library(models.Model):
    _name = 'library.library'
    _description = '图书馆'

    name = fields.Char(string="书名")
    authors = fields.Many2many('library.partner', ondelete='set null', string="作者")
    editors = fields.Many2one('library.partner', ondelete='set null', string="编辑")
    year = fields.Char(string='年份')
    edition = fields.Char(string="版本")
    ISBN = fields.Char(string="ISBN")

    description = fields.Text(string="书籍描述")
    rent_ids = fields.Many2many('library.rent', string="借书记录")
    book_rent = fields.Boolean(string="已借出")
```

> `_name`: 引用时使用的对象名称  
> `fields.Xxxx`: 各种字段

## views各种视图定义

> `menuitem`: 菜单定义

```xml
<menuitem name="图书馆"
            web_icon="library,static/description/icon.png"
            id="library_menu_root"
            sequence="0"/>

<menuitem name="书籍"
            id="library_menu_1"
            action="library_book_action"
            parent="library_menu_root"
            sequence="10"/>
```

> `action`: 动作定义

```xml
<record model="ir.actions.act_window"  id="library_rent_action">
    <field name="name">借阅记录</field>
    <field name="res_model">library.rent</field>
    <field name="type">ir.actions.act_window</field>
    <field name="view_type">form</field>
    <field name="view_id" ref="library_rent_list"/>
    <field name="view_mode">tree,kanban,form</field>
</record>
```

> `tree`和`form`视图

```xml
<!-- tree视图 -->
<record model="ir.ui.view" id="library_partner_list">
    <field name="name">Library list</field>
    <field name="model">library.partner</field>
    <field name="arch" type="xml">
        <tree>
            <field name="name"/>
        </tree>
    </field>
</record>
<!-- form视图 -->
<record model="ir.ui.view" id="library_partner_form">
    <field name="name">Library list</field>
    <field name="model">library.partner</field>
    <field name="arch" type="xml">
        <form>
            <sheet>
                <group>
                    <field name="name" required="1"/>
                </group>
            </sheet>
        </form>
    </field>
</record>
```

## data中的xml写入预置数据

> 方便模块测试在安装时预置数据

```xml
<!-- 向模型library.partner中写入一条记录 -->
<record id="object0" model="library.partner">
    <field name="name">作者甲</field>
</record>
```
