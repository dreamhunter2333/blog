---
title: hotpatch 驱动 Fn 亮度快捷键
date: 2019-04-02 20:55:26
tags: hackintosh
categories: hackintosh
---
## 针对 intel 核显

### 为什么要驱动 Fn 亮度快捷键

* fn+功能键直接调节亮度

### hotpatch Fn 样例

* 我的 `hotpatch` Fn 样例
* [SSDT-Fn.dsl](https://github.com/jinmu333/Shinalon_YAO_7000_efi/blob/efi/EFI/CLOVER/ACPI/patched/SSDT-Fn.dsl)

### DSDT/SSDT 如何提取 反编译 请看这篇

* [DSDT提取](https://jcstaff.club/2019/03/31/DSDT-SSDT-%E7%94%B5%E9%87%8F%E6%98%BE%E7%A4%BA/)

### 在 DSDT 中查找亮度调节方法

* 类似下面的方法
含有这两句的
Notify (^^^GFX0.DD1F, 0x87)
Notify (^^^GFX0.DD1F, 0x86)


``` bash
            Method (_Q14, 0, NotSerialized)  // _Qxx: EC Query
            {
                P8XH (Zero, 0x14)
                # 注意此行
                Notify (^^^GFX0.DD1F, 0x87)
            }

            Method (_Q15, 0, NotSerialized)  // _Qxx: EC Query
            {
                P8XH (Zero, 0x15)
                # 注意此行
                Notify (^^^GFX0.DD1F, 0x86)
            }
```

### 找到之后就可以开始制作 hotpatch 了

* 新建`ssdt-fn.dsl`
* 将里面的`_Q14` `_Q15` 改为你在上面查到的名字

``` bash
DefinitionBlock ("", "SSDT", 2, "hack", "fnkey", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)
    External (ATKP, IntObj)

    Method (_SB.PCI0.LPCB.EC0._Q14, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
    {
        Notify (\_SB.PCI0.LPCB.PS2K, 0x0405)
        Notify (\_SB.PCI0.LPCB.PS2K, 0x20) // Reserved
    }

    Method (_SB.PCI0.LPCB.EC0._Q15, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
    {
        Notify (\_SB.PCI0.LPCB.PS2K, 0x0406)
        Notify (\_SB.PCI0.LPCB.PS2K, 0x10) // Reserved
    }
}
```

### 编译为 ssdt-fn.aml

* 放入 `EFI/CLOVER/ACPI/patched/` 下
* 重启 不出意外 你的快捷键就能用了
