---
title: Windows10使用vscode利用linux子系统运行odoo12
date: 2019-09-21 15:14:45
tags: 
    - odoo
    - wsl
    - linux
categories:
    - [odoo]
    - [linux]
---

# Windows10使用vscode利用linux子系统运行odoo12

## linux子系统环境配置并运行odoo12

[linux子系统环境配置并运行odoo12](http://jcstaff.club/2019/08/25/Run-Odoo-in-Windows-WSL/)

## 使用vscode运行linux子系统的odoo12

安装 `Visual Studio Code` 插件 `Remote - WSL`
配置启动文件
**`.vscode/launch.json`**

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Python: Odoo",
            "type": "python",
            "request": "launch",
            "program": "${workspaceFolder}/odoo/odoo-bin",
            "console": "integratedTerminal",
            "args": [
                "-c",
                "${workspaceFolder}/wsl.conf",
                // "-d", "odoo", "-i", "base", "--stop-after-init"
            ]
        }
    ]
}
```
