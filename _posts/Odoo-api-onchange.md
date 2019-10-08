---
title: Odoo api onchange
date: 2019-10-08 09:42:05
tags: 
    - odoo
    - api
    - onchange
categories: odoo
---

## @api.onchange：动态更新UI

```python
@api.onchange('demo')
def onchange_demo(self):
    # 循环多条记录
    for rec in self:
        # 判断字段是否存在
        if rec.demo:
            if rec.demo < 0:
                # 弱提醒
                return {'warning': {'title': "title", 'message': "message"}}
```
