---
title: Odoo 模型和视图的继承、修改
date: 2019-08-21 17:52:48
tags: odoo
categories: odoo
---

# Odoo 模型和视图的继承、修改

## Python 模型中的继承、修改

```python
class Demo(models.Model)
    _inherit = "demo"
    ...
```

## Xml 视图中的继承、修改

```xml
<!--search视图继承-->
<record  id="demo__search_inherit" model="ir.ui.view">
    <field name="name">demo</field>
    <field name="model">demo</field>
    <field name="inherit_id" ref="demo_search"/>
    <field name="arch" type="xml">
        <xpath expr="//filter[@name='name']" position="attributes">
            <attribute name="string">name</attribute>
        </xpath>
    </field>
</record>
```