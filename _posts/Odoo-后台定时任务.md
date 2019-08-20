---
title: Odoo 后台定时任务
date: 2019-08-20 17:36:20
tags: odoo
categories: odoo
---

# Odoo 后台定时任务

## XML 文件定义

```xml
<record id="ir_cron_submit_ap_action" model="ir.cron">
    <field name="name">自动计划</field>
    <field name="model_id" ref="model_library_rent"/>
    <field name="state">code</field>
    <field name="code">model.submit_amount_plan()</field>
    <field name="interval_number">1</field>
    <field name="interval_type">minutes</field>
    <field name="numbercall">-1</field>
    <field eval="True" name="doall"/>
    <field name="user_id" ref="base.user_root"/>
</record>
```
## Python 文件定义

```python
@api.multi
def submit_amount_plan(self):
    for plan in self.search([('end_date', '<', fields.Datetime.now())]):
        if plan.is_rent:
            pass
```