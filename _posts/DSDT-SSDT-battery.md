---
title: DSDT SSDT 电量显示
date: 2019-03-31 15:18:17
tags: hackintosh
categories: hackintosh
---
### 为什么要制作电量补丁？制作电量补丁的好处是什么

* 笔记本当然要显示剩余电量辣

### DSDT-Patch样例

* RehabMan的Laptop-DSDT-Patch样例
* [RehabMan/Laptop-DSDT-Patch](https://github.com/RehabMan/Laptop-DSDT-Patch)

### DSDT/SSDT 是什么，如何提取

**DSDT

* DSDT是主板BIOS中ACPI的一个表。什么是ACPI呢，它是BIOS的一个高级功能模块。
* 修改DSDT的基本过程
* 提取bios的AML文件，反编译为dsl文件，修改完毕后，编译到Aml--〉替换BIOS中的DSDT。
* 技术的进步让我们可以由clover来加载编译好的DSDT.aml文件在修复ACPI缺陷，使主板更好支持苹果系统。

**提取DSDT**

* 1.clover 界面 F4 提取到 `EFI/CLOVER/ACPI/origin`
* 2.MACiASL提取
* 3.windows、linux提取
* linux提取 `/sys/fireware/acpi/tables` 文件夹即可

### DSDT/SSDT 的反编译

**DSDT提取完你的目录类似如下**

* APIC    DBGP    FACP    FPDT    MCFG    SSDT2   SSDT5   SSDT8   UEFI    dynamic
BGRT    DMAR    FACS    HPET    MSDM    SSDT3   SSDT6   SSDT9   WSMT
DBG2    DSDT    FIDT    LPIT    SSDT1   SSDT4   SSDT7   TPM2    data

**只需要dsdt ssdt开头的文件(不包括ssdt-x)**

* linux提取的自行加上后缀`aml`
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
****
**此时你的目录应该如下**  

* DSDT.aml  SSDT1.dsl SSDT3.aml SSDT4.dsl SSDT6.aml SSDT7.dsl SSDT9.aml
DSDT.dsl  SSDT2.aml SSDT3.dsl SSDT5.aml SSDT6.dsl SSDT8.aml SSDT9.dsl
SSDT1.aml SSDT2.dsl SSDT4.aml SSDT5.dsl SSDT7.aml SSDT8.dsl

* `DSDT.dsl` 就是我们需要的文件

### DSDT/SSDT 关于电量显示的修改

**使用 MACiASL 打开 DSDT.dsl**

* 点击编译，确保没有错误 否则需要先进行除错
* 错误一般都是 引入错误 和类型错误

![1](/imgs/dsdt1.png)
****
**找到电池变量位置**

* 在DSDT中搜索 `embeddedcontrol`
* 应该会有如下的一段或几段
* macos 无法读取超过8字节的数据 因此我们要将超过8字节的数据拆分

``` bash
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
                # ...此处省略
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
                # ...此处省略
            }
```

****
**找到电池变量引用位置**

* 以 `XIF1` 为例 （`XIF0`没有引用）

``` bash
# 第一个引用 第二个引用
            Method (ECBE, 0, NotSerialized)
            {
                Acquire (MUEX, 0xFFFF)
                Store ("ECBE", Debug)
                # XIF1 第一个引用
                Store (^^PCI0.LPCB.EC0.XIF1, Index (PAK0, One))
                If (LGreaterEqual (^^PCI0.LPCB.EC0.CYCN, 0x32))
                {
                    Store (^^PCI0.LPCB.EC0.XIF2, Index (PAK0, 0x02))
                }
                Else
                {
                    # XIF1 第二个引用
                    Store (^^PCI0.LPCB.EC0.XIF1, Index (PAK0, 0x02))
                }

                Store (^^PCI0.LPCB.EC0.XIF3, Index (PAK0, 0x03))
                Store (^^PCI0.LPCB.EC0.XIF4, Index (PAK0, 0x04))
                Store (^^PCI0.LPCB.EC0.XIF7, Index (PAK0, 0x07))
                Release (MUEX)
            }

# 第三个引用
            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                Acquire (MUEX, 0xFFFF)
                Store ("BST1 Start", Debug)
                If (LEqual (^^PCI0.LPCB.EC0.BSOK, One))
                {
                    Store (^^PCI0.LPCB.EC0.XST0, Index (BFB0, Zero))
                    Store (^^PCI0.LPCB.EC0.XST1, Index (BFB0, One))
                    If (LGreaterEqual (^^PCI0.LPCB.EC0.CYCN, 0x32))
                    {
                        Store (^^PCI0.LPCB.EC0.XST2, Index (BFB0, 0x02))
                    }
                    Else
                    {
                        Store (Divide (Multiply (^^PCI0.LPCB.EC0.XST2, 0x64), ^^PCI0.LPCB.EC0.XIF2, ), Local0)

                        # XIF1 第三个引用
                        Store (Divide (^^PCI0.LPCB.EC0.XIF1, 0x64, ), Local1)
                        Store (Multiply (Local0, Local1), Index (BFB0, 0x02))
                    }

                    Store (^^PCI0.LPCB.EC0.XST3, Index (BFB0, 0x03))
                    Store ("BST1 End", Debug)
                }

                Release (MUEX)
                Return (BFB0)
            }
```

****
**编写电池补丁**

* 新建一个`txt`
* 将下面的复制过去
* 这是电池补丁用到的几个方法
* 拆分16位
* 大于32位的不需要拆

``` bash
#Create B1B2 Method
into method label B1B2 remove_entry;
into definitionblock code_regex . insert
begin
Method (B1B2, 2, NotSerialized) { Return(Or(Arg0, ShiftLeft(Arg1, 8))) }\n
end;

# utility methods to read/write buffers from/to EC
into method label RE1B parent_label EC0 remove_entry;
into method label RECB parent_label EC0 remove_entry;
into device label EC0 insert
begin
Method (RE1B, 1, NotSerialized)\n
{\n
    OperationRegion(ERAM, EmbeddedControl, Arg0, 1)\n
    Field(ERAM, ByteAcc, NoLock, Preserve) { BYTE, 8 }\n
    Return(BYTE)\n
}\n
Method (RECB, 2, Serialized)\n
{\n
    ShiftRight(Arg1, 3, Arg1)\n
    Name(TEMP, Buffer(Arg1) { })\n
    Add(Arg0, Arg1, Arg1)\n
    Store(0, Local0)\n
    While (LLess(Arg0, Arg1))\n
    {\n
        Store(RE1B(Arg0), Index(TEMP, Local0))\n
        Increment(Arg0)\n
        Increment(Local0)\n
    }\n
    Return(TEMP)\n
}\n
end;

#utility method to write to EC buffers
into method label WE1B parent_label EC0 remove_entry;
into method label WECB parent_label EC0 remove_entry;
into device label EC0 insert
begin
Method (WE1B, 2, NotSerialized)\n
{\n
    OperationRegion(ERAM, EmbeddedControl, Arg0, 1)\n
    Field(ERAM, ByteAcc, NoLock, Preserve) { BYTE, 8 }\n
    Store(Arg1, BYTE)\n
}\n
Method (WECB, 3, Serialized)\n
{\n
    ShiftRight(Arg1, 3, Arg1)\n
    Name(TEMP, Buffer(Arg1) { })\n
    Store(Arg2, TEMP)\n
    Add(Arg0, Arg1, Arg1)\n
    Store(0, Local0)\n
    While (LLess(Arg0, Arg1))\n
    {\n
        WE1B(Arg0, DerefOf(Index(TEMP, Local0)))\n
        Increment(Arg0)\n
        Increment(Local0)\n
    }\n
}\n
end;

```
****
* 拆分变量 以上面的 `XIF1` 为例
* 如下加到`txt`中

``` bash
# 拆分16位属性
# 大于32位的不需要拆
into device label EC0 code_regex XIF1,\s+16, replace_matched begin X2IF,8,X3IF,8, end;
```
****
* 重命名 引用变量 以上面的 `XIF1` 为例
* 如下加到`txt`中

``` bash
# 重命名 访问16位属性
# ECBE _BST 是上面变量所在的 method ^^PCI0.LPCB.EC0.XIF1 是变量
into method label ECBE code_regex \(\^\^PCI0.LPCB.EC0.XIF1 replaceall_matched begin (^^B1B2(PCI0.LPCB.EC0.X2IF, PCI0.LPCB.EC0.X3IF) end;
into method label _BST code_regex \(\^\^PCI0.LPCB.EC0.XIF1 replaceall_matched begin (^^B1B2(PCI0.LPCB.EC0.X2IF, PCI0.LPCB.EC0.X3IF) end;
```
****
* 对应大于16位的处理请看
[远景教程1](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1751487)
[远景教程2](http://bbs.pcbeta.com/viewthread-1751497-1-1.html)

**txt 补丁做好之后 MACiASL 选择patch**

* 加载你的txt文件
* 点击应用，将`dsl` 输出为`aml`
* 放入 `EFI/CLOVER/ACPI/patched/` 下
* 重启应该就可以看到电池了

### DSDT/SSDT 附件

* [txt文件](https://github.com/jinmu333/Shinalon_YAO_7000_efi/blob/efi/%E8%80%807000%E7%94%B5%E6%B1%A0.txt)

**我的 txt 补丁**

``` bash
# created by jinmu333
#炫龙耀7000

# add method B1B2 
into method label B1B2 remove_entry;
into definitionblock code_regex . insert
begin
Method (B1B2, 2, NotSerialized)\n
{\n
Return(Or(Arg0, ShiftLeft(Arg1, 8)))\n
}\n
end;


# patch battery status        //为电池状态补丁

# 拆分16位属性
# 大于32位的不需要拆
into device label EC0 code_regex XIF0,\s+16, replace_matched begin X0IF,8,X1IF,8, end;
into device label EC0 code_regex XIF1,\s+16, replace_matched begin X2IF,8,X3IF,8, end;
into device label EC0 code_regex XIF2,\s+16, replace_matched begin X4IF,8,X5IF,8, end;
into device label EC0 code_regex XIF3,\s+16, replace_matched begin X6IF,8,X7IF,8, end;
into device label EC0 code_regex XIF4,\s+16, replace_matched begin X8IF,8,X9IF,8, end;
into device label EC0 code_regex XIF5,\s+16, replace_matched begin XI0F,8,XI1F,8, end;
into device label EC0 code_regex XIF6,\s+16, replace_matched begin XI2F,8,XI3F,8, end;
into device label EC0 code_regex XIF7,\s+16, replace_matched begin XI4F,8,XI5F,8, end;
into device label EC0 code_regex XIF8,\s+16, replace_matched begin XI6F,8,XI7F,8, end;

into device label EC0 code_regex XST0,\s+16, replace_matched begin X0ST,8,X1ST,8, end;
into device label EC0 code_regex XST1,\s+16, replace_matched begin X2ST,8,X3ST,8, end;
into device label EC0 code_regex XST2,\s+16, replace_matched begin X4ST,8,X5ST,8, end;
into device label EC0 code_regex XST3,\s+16, replace_matched begin X6ST,8,X7ST,8, end;

into device label EC0 code_regex XTP0,\s+16, replace_matched begin X0TP,8,X1TP,8, end;

into device label EC0 code_regex SLUX,\s+16, replace_matched begin S0LU,8,S1LU,8, end;

into device label EC0 code_regex CYCN,\s+16, replace_matched begin C0YC,8,C1YC,8, end;

into device label EC0 code_regex BIF0,\s+16, replace_matched begin B0IF,8,B1IF,8, end;
into device label EC0 code_regex BIF1,\s+16, replace_matched begin B2IF,8,B3IF,8, end;
into device label EC0 code_regex BIF3,\s+16, replace_matched begin B4IF,8,B5IF,8, end;
into device label EC0 code_regex BIF4,\s+16, replace_matched begin B6IF,8,B7IF,8, end;
into device label EC0 code_regex BIF5,\s+16, replace_matched begin B8IF,8,B9IF,8, end;
into device label EC0 code_regex BIF6,\s+16, replace_matched begin BI0F,8,BI1F,8, end;
into device label EC0 code_regex BIF7,\s+16, replace_matched begin BI2F,8,BI3F,8, end;
into device label EC0 code_regex BIF8,\s+16, replace_matched begin BI4F,8,BI5F,8, end;
into device label EC0 code_regex BIF2,\s+16, replace_matched begin BI6F,8,BI7F,8, end;

into device label EC0 code_regex BST0,\s+16, replace_matched begin B0ST,8,B1ST,8, end;
into device label EC0 code_regex BST1,\s+16, replace_matched begin B2ST,8,B3ST,8, end;
into device label EC0 code_regex BST2,\s+16, replace_matched begin B4ST,8,B5ST,8, end;
into device label EC0 code_regex BST3,\s+16, replace_matched begin B6ST,8,B7ST,8, end;

into device label EC0 code_regex BTP0,\s+16, replace_matched begin B0TP,8,B1TP,8, end;



# 访问16位属性
into method label ECBE code_regex \(\^\^PCI0.LPCB.EC0.XIF1 replaceall_matched begin (^^B1B2(PCI0.LPCB.EC0.X2IF, PCI0.LPCB.EC0.X3IF) end;
into method label _BST code_regex \(\^\^PCI0.LPCB.EC0.XIF1 replaceall_matched begin (^^B1B2(PCI0.LPCB.EC0.X2IF, PCI0.LPCB.EC0.X3IF) end;
into method label ECBE code_regex \(\^\^PCI0.LPCB.EC0.XIF2 replaceall_matched begin (^^B1B2(PCI0.LPCB.EC0.X4IF, PCI0.LPCB.EC0.X5IF) end;
into method label _BST code_regex \^\^PCI0.LPCB.EC0.XIF2 replaceall_matched begin ^^B1B2(PCI0.LPCB.EC0.X4IF, PCI0.LPCB.EC0.X5IF) end;
into method label ECBE code_regex \(\^\^PCI0.LPCB.EC0.XIF3 replaceall_matched begin (^^B1B2(PCI0.LPCB.EC0.X6IF, PCI0.LPCB.EC0.X7IF) end;
into method label ECBE code_regex \(\^\^PCI0.LPCB.EC0.XIF4 replaceall_matched begin (^^B1B2(PCI0.LPCB.EC0.X8IF, PCI0.LPCB.EC0.X9IF) end;
into method label ECBE code_regex \(\^\^PCI0.LPCB.EC0.XIF7 replaceall_matched begin (^^B1B2(PCI0.LPCB.EC0.XI4F, PCI0.LPCB.EC0.XI5F) end;
into method label _BST code_regex \(\^\^PCI0.LPCB.EC0.XST0 replaceall_matched begin (^^B1B2(PCI0.LPCB.EC0.X0ST, PCI0.LPCB.EC0.X1ST) end;
into method label _BST code_regex \(\^\^PCI0.LPCB.EC0.XST1 replaceall_matched begin (^^B1B2(PCI0.LPCB.EC0.X2ST, PCI0.LPCB.EC0.X3ST) end;
into method label _BST code_regex \(\^\^PCI0.LPCB.EC0.XST2 replaceall_matched begin (^^B1B2(PCI0.LPCB.EC0.X4ST, PCI0.LPCB.EC0.X5ST) end;
into method label _BST code_regex \(\^\^PCI0.LPCB.EC0.XST3 replaceall_matched begin (^^B1B2(PCI0.LPCB.EC0.X6ST, PCI0.LPCB.EC0.X7ST) end;
into method label ECBE code_regex \(\^\^PCI0.LPCB.EC0.CYCN replaceall_matched begin (^^B1B2(PCI0.LPCB.EC0.C0YC, PCI0.LPCB.EC0.C1YC) end;
into method label _BST code_regex \(\^\^PCI0.LPCB.EC0.CYCN replaceall_matched begin (^^B1B2(PCI0.LPCB.EC0.C0YC, PCI0.LPCB.EC0.C1YC) end;

```