---
title: odoo13 searchpanel
date: 2019-10-11 15:16:03
tags: odoo
categories: odoo
---

## odoo13 searchpanel

```xml
<record model="ir.ui.view" id="demo_search">
    <field name="name">demo list</field>
    <field name="model">demo.demo</field>
    <field name="arch" type="xml">
            <searchpanel>
                <field name="demo" icon="fa-users"/>
            </searchpanel>
        </search>
    </field>
</record>
```

![searchpanel](/imgs/odoo/odoo-searchpanel.jpg)
