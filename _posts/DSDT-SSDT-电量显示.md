---
title: DSDT SSDT 电量显示
date: 2019-03-31 15:18:17
tags: hackintosh
categories: hackintosh
---
### 为什么要制作电量补丁？制作电量补丁的好处是什么？

* 笔记本当然要显示剩余电量辣

### DSDT-Patch样例

* RehabMan的Laptop-DSDT-Patch样例
* [RehabMan/Laptop-DSDT-Patch](https://github.com/RehabMan/Laptop-DSDT-Patch)

### DSDT/SSDT 是什么，如何提取

**DSDT**
* DSDT是主板BIOS中ACPI的一个表。什么是ACPI呢，它是BIOS的一个高级功能模块。
* 修改DSDT的基本过程
* 提取bios的AML文件，反编译为dsl文件，修改完毕后，编译到Aml--〉替换BIOS中的DSDT。
* 技术的进步让我们可以由clover来加载编译好的DSDT.aml文件在修复ACPI缺陷，使主板更好支持苹果系统。

**提取DSDT**
* 1.clover 界面 F4 提取到 EFI/CLOVER/ACPI/origin
* 2.MACiASL提取
* 3.windows、linux提取
* linux提取 /sys/fireware/acpi/tables 文件夹即可

