---
title: Odoo ir.sequence
date: 2019-10-10 14:59:54
tags: odoo
categories: odoo
---

## Odoo ir.sequence

### data xml

```xml
<record id="sequence_library_seq" model="ir.sequence">
    <field name="name">Library sequence</field>
    <field name="code">library.reconcile</field>
    <field name="prefix">LIB</field>
    <field eval="1" name="number_next"/>
    <field eval="1" name="number_increment"/>
    <field eval="True" name="use_date_range"/>
    <field eval="False" name="company_id"/>
    <field name="padding">5</field>
</record>
```

### python 重写create方法

```python
@api.model
def create(self, vals):
    vals['name'] = self.env['ir.sequence'].next_by_code('library.reconcile')
    return super(Library, self).create(vals)
```
