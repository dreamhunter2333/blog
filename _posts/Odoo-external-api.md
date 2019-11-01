---
title: Odoo external api
date: 2019-11-01 14:12:47
categories: odoo
tags: odoo
---

## Odoo 外部 api

```python
import xmlrpc.client


def test():
    url = "url"
    db = "dbname"
    username = 'admin'
    password = "admin"
    common = xmlrpc.client.ServerProxy('{}/xmlrpc/2/common'.format(url))
    print(common.version())
    uid = common.authenticate(db, username, password, {})
    print(uid)
    models = xmlrpc.client.ServerProxy('{}/xmlrpc/2/object'.format(url))
    access_right = models.execute_kw(db, uid, password,
                                     'res.users', 'check_access_rights',
                                     ['read'], {'raise_exception': False})
    print(access_right)
    search_return = models.execute_kw(db, uid, password,
                                      'res.users', 'search',
                                      [[('id', '!=', False)]],
                                      {'offset': 1, 'limit': 5})
    print(search_return)


if __name__ == "__main__":
    test()

```

```bash
# 输出
{'server_version_info': [13, 0, 0, 'final', 0, ''], 'protocol_version': 1, 'server_serie': '13.0', 'server_version': '13.0'}
2
True
[2]
```
