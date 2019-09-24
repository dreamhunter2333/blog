---
title: mipad2 小米平板2 win10 屏蔽三个按键
date: 2019-04-10 12:39:50
tags: mipad2
categories: linux
---
### 为什么要屏蔽

* win10下那三颗按键纯粹是多余,还总是引起误触

### 屏蔽方法（转自miui论坛）

* [原帖](http://embed.bbs.miui.com/thread-12282804-1-1.html)

****

#### 更改红方块中的驱动
![mipad2-1](/imgs/mipad2/mipad2-1.jpg)
****

#### 更新三个HID KeyboardDevice驱动为HID-compliant device
![mipad2-1](/imgs/mipad2/mipad2-2.jpg)
****

#### 选浏览计算机以查找驱动程序软件
![mipad2-1](/imgs/mipad2/mipad2-3.jpg)
****

#### 选从计算机的设备驱动程序列表中选取
![mipad2-1](/imgs/mipad2/mipad2-4.jpg)
****

#### 选HID-compliant device，然后下一步完成
#### 三个HID KeyboardDevice驱动分别改为HID-compliant device
#### 至此，三个按键被禁用了，但，还是会亮背光灯，接着来
![mipad2-1](/imgs/mipad2/mipad2-5.jpg)
****

#### 更新HID for FocalTech Touch驱动
![mipad2-1](/imgs/mipad2/mipad2-6.jpg)
****

#### 用同样的方法改为I2C HID设备
#### 改完以后，I2C HID设备驱动有感叹号，触摸屏同时也不能使用，用鼠标重启windows
#### 至此，触摸屏恢复正常，三个按键完全被禁用。
![mipad2-1](/imgs/mipad2/mipad2-7.jpg)
