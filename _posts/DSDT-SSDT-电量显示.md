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

### DSDT/SSDT 的反编译

**DSDT提取完你的目录类似如下**

* APIC    DBGP    FACP    FPDT    MCFG    SSDT2   SSDT5   SSDT8   UEFI    dynamic
BGRT    DMAR    FACS    HPET    MSDM    SSDT3   SSDT6   SSDT9   WSMT
DBG2    DSDT    FIDT    LPIT    SSDT1   SSDT4   SSDT7   TPM2    data

**只需要dsdt ssdt开头的文件(不包括ssdt-x)**

* linux提取的自行加上后缀aml
* DSDT.aml   SSDT3.aml  SSDT6.aml SSDT9.aml 
SSDT2.aml SSDT3.dsl SSDT5.aml SSDT8.aml 
SSDT1.aml SSDT4.aml  SSDT7.aml

**将上一步提取的文件反编译**

* iasl自行寻找对应版本

``` bash
# 一般可以联合反编译
iasl -da -dl *.aml

# 无法联合反编译 请尝试
iasl -dl *.aml
```

**此时你的目录应该如下**

* DSDT.aml  SSDT1.dsl SSDT3.aml SSDT4.dsl SSDT6.aml SSDT7.dsl SSDT9.aml
DSDT.dsl  SSDT2.aml SSDT3.dsl SSDT5.aml SSDT6.dsl SSDT8.aml SSDT9.dsl
SSDT1.aml SSDT2.dsl SSDT4.aml SSDT5.dsl SSDT7.aml SSDT8.dsl

* dsdt.dsl就是我们需要的文件