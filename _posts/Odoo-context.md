---
title: Odoo context
date: 2019-11-12 23:02:39
categories: odoo
tags:
    - [odoo]
    - [context]
---

## Odoo context

### 传context

```python
return {
    'type': 'ir.actions.act_window',
    'view_id': view_id,
    'view_type': 'form',
    'view_mode': 'form',
    'res_model': 'demo.demo',
    'target': 'current',
    # 将当前记录id放进 context
    'context': {'demo': self.id}
}
```

### 获取context

```python
# demo 在 context 中时 作为 demo_id 的默认值
demo_id = fields.Many2one('cashier.bank', default=lambda self: self.env.context.get('demo'))
```
