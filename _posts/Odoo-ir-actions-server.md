---
title: Odoo ir.actions.server
date: 2019-09-23 15:00:20
tags: odoo
categories: odoo
---

# Odoo ir.actions.server

<div align=center><img src="/imgs/odoo/odoo_action_server.png"></div>

## xml 配置

```xml
<record model="ir.actions.server" id="library_book_test">
    <field name="name">Actions_Server_Test</field>
    <field name="model_id" ref="model_library_library"/>
    <field name="binding_model_id" ref="model_library_library" />
    <field name="state">code</field>
    <field name="code">
        if records:
            action = records.test()
    </field>
</record>
```

## python 函数

```python
@api.multi
def test(self):
    for rec in self:
        print(rec)
```