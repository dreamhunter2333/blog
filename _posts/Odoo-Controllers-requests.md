---
title: Odoo Controllers requests
date: 2019-09-25 09:25:56
categories: odoo
tags: odoo
---

## Odoo Controllers requests

### conf 配置 dbfilter

`dbfilter=dbname`

### Controller 编写

```python
# -*- coding: utf-8 -*-
from odoo import http
import json


class HttpTest(http.Controller):

    @http.route('/testjson/', type='json', auth="none", methods=['get', 'post'])
    def indexjson(self, **kw):
        print(**kw)
        print(http.request.jsonrequest)
        return json.dumps({'test': 'test'})
```

### python 请求

```python
headers = {"Content-type": "application/json"}
result = requests.post('http://localhost:8090/testjson/', data=json.dumps({'1': '1'}), headers=headers)
result = json.loads(result.text).get('result')
```
