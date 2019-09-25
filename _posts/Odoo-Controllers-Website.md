---
title: Odoo Controllers Website
date: 2019-09-09 11:53:12
tags: odoo
categories: odoo
---

## Odoo Controllers Website

> Controllers/*.python
> 访问 `odoo网址/test`

```python
# -*- coding: utf-8 -*-
from odoo import http
import json


class HttpTest(http.Controller):

    @http.route('/test/', type='http', auth='public', website=True)
    def index(self, **kw):
        test = kw
        return json.dumps({'test': test})
```
