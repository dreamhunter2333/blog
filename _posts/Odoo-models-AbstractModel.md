---
title: Odoo models.AbstractModel
date: 2019-08-29 23:10:10
tags: odoo
categories: odoo
---

# Odoo 抽象类

## 定义 AbstractModel

> 无需外部id

```python
# -*- coding: utf-8 -*-
from odoo import api, fields, models


class Test(models.AbstractModel):
    _name = 'odoo.test'
    ...
```

## 继承 抽象类

> 有效解决代码重复

```python
class Test(models.Model):
    _inherit = ['odoo.test']
    ...
```