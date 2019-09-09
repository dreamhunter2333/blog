---
title: Odoo mail 消息记录
date: 2019-08-25 13:25:56
tags: 
    - odoo
    - mail
categories: odoo
---

# Odoo mail 消息记录

## Python 模型继承

```python
# 继承
    _inherit = ['mail.thread', 'mail.message']
```

```python
# 追踪字段
    xxx = fields.Boolean(track_visibility='onchange')
```

## xml 视图

```xml
<div class="oe_chatter">
    <field name="message_follower_ids" widget="mail_followers"/>
    <field name="message_ids" widget="mail_thread"/>
</div>
```