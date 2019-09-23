---
title: Odoo search视图
date: 2019-08-18 17:07:02
tags: odoo
categories: odoo
---

# odoo search视图

## action中添加 search_view_id

```xml
<record model="ir.actions.act_window" id="library_partner_action">
    ...
    <field name="search_view_id" ref="library_partner_search"/>
</record>
```
## 添加search视图

```xml
<record model="ir.ui.view" id="library_partner_search">
    ...
    <field name="arch" type="xml">
        <search string="Membership Partners">
            <filter name="a111" string="作者" domain="[('is_who', '=', 1)]"/>
        </search>
    </field>
</record>
```