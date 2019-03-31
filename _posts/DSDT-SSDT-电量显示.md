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
* DSDT.aml   
SSDT3.aml  
SSDT6.aml 
SSDT9.aml 
SSDT2.aml 
SSDT3.dsl 
SSDT5.aml 
SSDT8.aml 
SSDT1.aml 
SSDT4.aml  
SSDT7.aml

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

* DSDT.dsl 就是我们需要的文件

### DSDT/SSDT 关于电量显示的修改

**使用 MACiASL 打开 DSDT.dsl**

* 点击编译，确保没有错误 否则需要先进行除错
* 错误一般都是 引入错误 和类型错误

![1](/imgs/dsdt1.png)

``` bash
# 在DSDT中搜索 embeddedcontrol
# 应该会有如下的一段或几段
            OperationRegion (ECMP, EmbeddedControl, Zero, 0xFF)
            Field (ECMP, ByteAcc, Lock, Preserve)
            {
                Offset (0x7B), 
                DEVS,   8
            }

            OperationRegion (ECXP, EmbeddedControl, Zero, 0xFF)
            Field (ECXP, ByteAcc, Lock, Preserve)
            {
                XIF0,   16, 
                XIF1,   16, 
                XIF2,   16, 
                XIF3,   16, 
                XIF4,   16, 
                XIF5,   16, 
                XIF6,   16, 
                XIF7,   16, 
                XIF8,   16, 
                XIF9,   64, 
                XIFA,   64, 
                XIFB,   64, 
                XIFC,   64, 
                XST0,   16, 
                XST1,   16, 
                XST2,   16, 
                XST3,   16, 
                XTP0,   16, 
                # ...
                Offset (0xA6), 
                CYCN,   16, 
                Offset (0xC0), 
                BIF0,   16, 
                BIF1,   16, 
                BIF2,   16, 
                BIF3,   16, 
                BIF4,   16, 
                BIF5,   16, 
                BIF6,   16, 
                BIF7,   16, 
                BIF8,   16, 
                BIF9,   64, 
                BIFA,   64, 
                BIFB,   64, 
                BIFC,   64, 
                BST0,   16, 
                BST1,   16, 
                BST2,   16, 
                BST3,   16, 
                BTP0,   16, 
                # ...
            }
```