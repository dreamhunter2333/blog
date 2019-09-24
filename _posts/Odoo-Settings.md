---
title: Odoo Settings 界面
date: 2019-09-10 14:06:23
tags: odoo
categories: odoo
---

# Odoo Settings 界面

## python文件继承

```python
class ResConfigSettings(models.TransientModel):
    _inherit = 'res.config.settings'
    test_setting = fields.Boolean(string="图书馆 Test")

    @api.multi
    def set_values(self):
        super(ResConfigSettings, self).set_values()
        IrDefault = self.env['ir.default'].sudo()
        IrDefault.set('res.config.settings', 'test_setting', self.test_setting)

    @api.model
    def get_values(self):
        res = super(ResConfigSettings, self).get_values()
        IrDefault = self.env['ir.default'].sudo()
        res.update(test_setting=IrDefault.get('res.config.settings', 'test_setting'))
        return res
```

## xml 视图继承

```xml
<record id="res_config_settings_view_form" model="ir.ui.view">
    <field name="name">res.config.settings.view.form.inherit.library</field>
    <field name="model">res.config.settings</field>
    <field name="priority" eval="70"/>
    <field name="inherit_id" ref="base.res_config_settings_view_form"/>
    <field name="arch" type="xml">
        <xpath expr="//div[hasclass('settings')]" position="inside">
            <div class="app_settings_block" data-string="Library" string="Library" data-key="library"
                    groups="library.group_self_borrow">
                <h2>图书馆设置</h2>
                <div class="row mt16 o_settings_container">
                    <div class="col-12 col-lg-6 o_setting_box">
                        <div class="o_setting_left_pane" title="图书馆 test">
                            <field name="test_setting"/>
                        </div>
                        <div class="o_setting_right_pane">
                            <label for="test_setting"/>
                            <div class="text-muted">
                                library test
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </xpath>
    </field>
</record>
```
