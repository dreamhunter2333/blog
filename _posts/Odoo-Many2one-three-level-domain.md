---
title: Odoo Many2one三级联动
date: 2019-09-03 16:53:31
tags: odoo
categories: odoo
---

# Odoo Many2one三级联动

## python 文件

```python
class TrainLibrary(models.Model):
    _name = 'train.library'
    _description = '图书馆'

    name = fields.Char(string='图书馆记录')

    library_id = fields.Many2one('train.library.info', string='图书馆')
    category_id = fields.Many2one('train.library.category', string='书籍种类')
    book_id = fields.Many2one('train.library.book', string='书籍名称')
```

```python
class Library(models.Model):
    _name = 'train.library.info'
    _description = '图书馆'

    name = fields.Char(string='图书馆名称')
    category_ids = fields.One2many('train.library.category', 'info_id', string='书籍种类')


class BookCategory(models.Model):
    _name = 'train.library.category'
    _description = '图书馆'

    name = fields.Char(string='书籍种类')
    info_id = fields.Many2one('train.library.info', string='图书馆名称')
    book_ids = fields.One2many('train.library.book', 'category_id', string='书籍')


class Book(models.Model):
    _name = 'train.library.book'
    _description = '图书馆'

    name = fields.Char(string='书籍名称')
    category_id = fields.Many2one('train.library.category', string='书籍种类')
```

## xml视图 domain

```xml
<form>
    <sheet>
        <group col="6" colspan="2">
            <field name="library_id"/>
            <field name="category_id" domain="[('info_id', '=', library_id)]"/>
            <field name="book_id" domain="[('category_id', '=', category_id)]"/>
        </group>
    </sheet>
</form>
```
