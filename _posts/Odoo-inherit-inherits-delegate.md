---
title: Odoo _inherit _inherits(delegate)
date: 2019-09-16 19:24:00
tags: odoo
categories: odoo
---

# Odoo 继承

# _inherit
- _name和_inherit不同
  - _inherit 属性传入多个值来继承多个父模型
- _name和_inherit相同
  - 同名继承 修改原模型

# _inherits 同 delegate

- 使用代理继承无需复制数据即可在数据库中复用数据结构，这通过将一个模型嵌入另一个来实现。UML 中这种称作组合(composition)关系：父类无需子类即可存在，而子类必须要有父类才能存在。

```python
_inherits = {‘res.partner’: ‘partner_id’}

delegate=True
```