---
title: Odoo class Many2many
date: 2019-09-24 10:49:33
categories: odoo
tags:
    - odoo
    - many2many
---

# Odoo class Many2many

## python Many2many 源码解释

- :param relation: optional name of the table that stores the relation in the database (string)
- :param column1: optional name of the column referring to "these" records in the table ``relation`` (string)
- :param column2: optional name of the column referring to "those" records in the table ``relation`` (string)
- The attributes ``relation``, ``column1`` and ``column2`` are optional. If not given, names are automatically generated from model names, provided ``model_name`` and ``comodel_name`` are different!

```python
class Many2many(_RelationalMulti):
    """ Many2many field; the value of such a field is the recordset.

        :param comodel_name: name of the target model (string)

        The attribute ``comodel_name`` is mandatory except in the case of related
        fields or field extensions.

        :param relation: optional name of the table that stores the relation in
            the database (string)

        :param column1: optional name of the column referring to "these" records
            in the table ``relation`` (string)

        :param column2: optional name of the column referring to "those" records
            in the table ``relation`` (string)

        The attributes ``relation``, ``column1`` and ``column2`` are optional. If not
        given, names are automatically generated from model names, provided
        ``model_name`` and ``comodel_name`` are different!

        :param domain: an optional domain to set on candidate values on the
            client side (domain or string)

        :param context: an optional context to use on the client side when
            handling that field (dictionary)

        :param limit: optional limit to use upon read (integer)

    """
```

## python Many2many 例子

![many2many](/imgs/odoo/odoo_class_many2many.png)

```python
class Library(models.Model):
    _name = 'library.library'
    # comodel_name: library_library
    # relation: library_library_library_partner_rel
    # column1: library_library_id
    # column2: library_partner_id
    authors = fields.Many2many('library.partner')
```

## python Many2many 自定义 relation column1 column2

![many2many](/imgs/odoo/odoo_class_many2many_2.png)

```python
class Library(models.Model):
    _name = 'library.library'
    # comodel_name: library_library
    # relation: library_library_library_partner_rel
    # column1: library_library_id
    # column2: library_partner_id
    authors = fields.Many2many('library.partner', 'library_relation', 'relation_library_id', 'relation_partner_id')
```
