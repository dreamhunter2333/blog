---
title: Odoo ir.rule 记录规则
date: 2019-08-20 00:21:20
tags: odoo
categories: odoo
---

# Odoo ir.rule 记录规则

```xml
<record id="company_id_rule" model="ir.rule">
    <field name="name">多公司</field>
    <field name="model_id" ref="model_multi_company"/>
    <field name="groups" eval="[(4, ref('base.group_user'))]"/>
    <field name="domain_force">['|',('company_id','=',False),('company_id.id','=',user.company_id.id)]
    </field>
</record>
```