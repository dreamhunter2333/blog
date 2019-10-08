---
title: Odoo @api.* 装饰器
date: 2019-08-19 18:37:22
tags: 
    - odoo
    - api
categories: odoo
---

# Odoo @api.* 装饰器

## @api.one

> one的用法主要用于self为单一记录的情况，self仅代表当前正在操作的记录。

## @api.multi

> multi则指self是多个记录的合集。因此，常使用for—in语句遍历self。
> multi通常用于：在tree视图中点选多条记录，然后执行某方法，那么那个方法必须用@api.multi修饰，而参数中的self则代表选中的多条记录。
> 如果仅仅是在form视图下操作，那么self中通常只有当前正在操作的记录。

## @api.model

> 此时的self仅代表模型本身，不含任何记录信息。

## @api.contrains

> 在保存时对字段进行约束。
> 抛出异常不能保存

## @api.depends('xxx')

> 使用compute参数计算字段时。它必须将计算值分配给字段。  
> 如果它使用其他字段的值，则应使用`@api.depends()`指定这些字段

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

> 当用户更改表单中的字段值（但尚未保存表单）时，根据该值自动更新其他字段可能很有用，
> 计算字段会自动检查并重新计算，它们不需要 onchange
对于非计算字段，onchange()装饰器用于提供新的字段值：


> 可以通过on_change="0"在视图中添加来禁止来自特定字段的触发器 ：
```xml
<field name ="name" on_change ="0"/>
```

> 警告: one2many或many2manyfield 不可能通过onchange修改自身

## @api.returns

> returns的用法主要是用来指定返回值的格式，它接受三个参数:  
> 第一个为返回值的model  
> 第二个为向下兼容的method  
> 第三个为向上兼容的method