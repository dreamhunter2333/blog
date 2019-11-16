---
title: Odoo domain inverse 'in'
date: 2019-11-16 10:02:42
categories: odoo
tags: odoo
---

## Odoo domain inverse 'in'

`[('demo_ids', 'in', demo_id.id)]`

`domain` 操作符中的 `in` 可以反向表示，

```xml
<field name="domain_force">[('user_ids', 'in', user.id)]</field>
```

```python
self.search([('user_ids', 'in', user.id)])
```
