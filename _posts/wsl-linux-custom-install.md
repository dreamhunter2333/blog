---
title: wsl linux custom install
date: 2020-01-06 21:42:01
categories: wsl
tags: wsl
---

## wsl linux custom install

### LxRunOffline WSL 自定义安装、备份

安装 LxRunOffline
普通手动安装：下载解压 [LxRunOffline](https://github.com/DDoSolitary/LxRunOffline/releases) ，并设置环境变量。

下载 [WSL 官方离线包](https://p3terx.com/go/aHR0cHM6Ly9kb2NzLm1pY3Jvc29mdC5jb20vZW4tdXMvd2luZG93cy93c2wvaW5zdGFsbC1tYW51YWw=)，改后缀名为.zip，解压。
或者在 [LxRunOffline WiKi](https://p3terx.com/go/aHR0cHM6Ly9naXRodWIuY29tL0REb1NvbGl0YXJ5L0x4UnVuT2ZmbGluZS93aWtp) 中下载镜像文件。

```bash
lxrunoffline i -n <WSL名称> -d <安装路径> -f <安装包路径>.tar.gz
```

使用 LxRunOffline 设置默认用户
当修改过 WSL 的名称或目录后就无法通过微软官方提供的方法设置默认用户。这时可以使用 LxRunOf­fline 进行设置。

设置普通用户为默认用户
使用 LxRunOf­fline 新安装的 WSL 默认是以 root 用户登录，如果你需要默认以普通用户进行登录，就需要进行下面的操作。

首先运行 WSL ，输入以下命令创建用户：

```bash
useradd -m -s /bin/bash <用户名>
passwd <用户名>
# 授予该用户 sudo 权限。
usermod -aG sudo <用户名>
```

为了保持和微软商店安装的效果一致，这里提及的方法是把用户添加到 sudo 用户组。其他关于 sudo 权限的设置方法以及免密设置可参考《Linux 中授予普通用户 sudo 权限的正确方法》这篇文章。
查看用户 UID ，一般是 1000。

```bash
id -u <用户名>
# 按 Ctrl+D 退出 WSL ，在 Pow­er­Shell 中输入以下命令：
lxrunoffline su -n <WSL名称> -v 1000
# 设置 root 为默认用户
root 用户的 UID 为 0，所以可以直接在 Pow­er­Shell 输入以下命令进行设置：
lxrunoffline su -n <WSL名称> -v 0
```

```bash
# 使用 LxRunOffline 转移 WSL 安装目录
# LxRunOf­fline 可以对系统中已经安装的 WSL 进行目录转移操作，拯救爆满的 C 盘。
# 查看系统中已安装的 WSL 。
lxrunoffline l
# 类似于wsl -l。LxRunOf­fline 不会显示默认 WSL ，查看默认 WSL 需要使用 lxrunoffline gd命令。
# 输入命令对 WSL 的目录进行移动。
lxrunoffline m -n <WSL名称> -d <路径>
# 最后查看路径，进行确认。
lxrunoffline di -n <WSL名称>
# 使用 LxRunOffline 备份和恢复 WSL
# 使用 LxRunOf­fline 可以方便的对 WSL 进行备份和恢复，同样可以实现转移的操作，而且还可以在转移到其它电脑上。
# 备份 WSL
# 查看系统中已安装的 WSL 。
wsl -l
# 然后输入需要备份的 WSL 名称和备份的目标路径。
lxrunoffline e -n <WSL名称> -f <压缩包路径>.tar.gz
# 类似但不等同于wsl --export <WSL名称> <压缩包路径>.tar。LxRunOf­fline 备份完会生成一个.xml后缀的同名配置文件，比如WSL.tar.gz.xml。
# 恢复 WSL
# 输入以下命令可以恢复已备份的 WSL，和安装是相同的命令。
lxrunoffline i -n <WSL名称> -d <安装路径> -f <压缩包路径>.tar.gz
# 类似但不等同于wsl --import <WSL名称> <安装路径> <压缩包路径>.tar。LxRunOf­fline 会读取备份时生成的配置文件并写入配置，前提是同目录且同名。否则你需要加入-c参数指定配置文件。
# 使用 LxRunOffline 运行 WSL
# 和原生运行方式本质上是一样的。
# 创建快捷方式
# 使用微软应用商店安装的 WSL 会在开始菜单添加应用图标（快捷方式），而使用 LxRunOf­fline 安装 WSL 时可以通过添加 -s 参数在桌面创建快捷方式。如果你安装时忘记添加参数，可以使用以下命令进行创建。
lxrunoffline s -n <WSL名称> -f <快捷方式路径>.lnk
# 使用命令运行指定 WSL
# 在有多个 WSL 的情况下，可以指定运行某个发行版。
lxrunoffline r -n <WSL名称>
# 等同于wsl -d <WSL名称>
# 设置默认 WSL
# 设置默认 WSL 后，可以在 cmd 和 powershell 中输入 wsl 直接调用默认的 WSL 。
lxrunoffline sd -n <WSL名称>
# 等同于wsl -s <WSL名称>
# 使用 LxRunOffline 修改 WSL 名称
# 查看 WSL 名称。
wsl -l
# 查看 WSL 安装目录。
lxrunoffline di -n <WSL名称>
# 导出指定的 WSL 配置文件到目标路径。
lxrunoffline ec -n <WSL名称> -f <配置文件路径>.xml
# 配置信息可以输入lxrunoffline sm -n <WSL名称>查看
# 取消注册（这个操作不会删除目z录）
lxrunoffline ur -n <WSL名称>
# 使用新名称注册
lxrunoffline rg -n <WSL名称> -d <WSL路径> -c <配置文件路径>.xml
```

### 安装中文语言包

```bash
# 查看语言环境
echo $LANG
# 安装中文语言包
sudo apt-get install  language-pack-zh-hans
sudo apt install $(check-language-support)
# 替换 /etc/default/locale 为如下内容
# LANG="zh_CN.UTF-8"
# LANGUAGE="zh_CN:zh"
# LC_NUMERIC="zh_CN"
# LC_TIME="zh_CN"
# LC_MONETARY="zh_CN"
# LC_PAPER="zh_CN"
# LC_NAME="zh_CN"
# LC_ADDRESS="zh_CN"
# LC_TELEPHONE="zh_CN"
# LC_MEASUREMENT="zh_CN"
# LC_IDENTIFICATION="zh_CN"
# LC_ALL="zh_CN.UTF-8"
sudo nano /etc/default/locale
# /etc/environment 添加如下内容
# LANG="zh_CN.UTF-8"
# LANGUAGE="zh_CN:zh"
# LC_NUMERIC="zh_CN"
# LC_TIME="zh_CN"
# LC_MONETARY="zh_CN"
# LC_PAPER="zh_CN"
# LC_NAME="zh_CN"
# LC_ADDRESS="zh_CN"
# LC_TELEPHONE="zh_CN"
# LC_MEASUREMENT="zh_CN"
# LC_IDENTIFICATION="zh_CN"
# LC_ALL="zh_CN.UTF-8"
sudo nano /etc/environment
mkdir -p /usr/share/fonts/windows
cp -r /mnt/c/Windows/Fonts/*.ttf /usr/share/fonts/windows/
locale-gen zh_CN.UTF-8
sudo dpkg-reconfigure locales
```

安装zsh

```bash
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### xrdp 远程图形界面的配置

```bash
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y
sudo apt-get update
sudo apt-get install xorg
sudo apt-get install xfce4
sudo apt-get install xrdp
sudo sed -i ‘s/port=3365/port=33365/g’ /etc/xrdp/xrdp.ini
sudo echo xfce4-session >~/.xsession
sudo service xrdp restart
```

```bash
# xrdp 打不开程序 执行
sudo apt install libexo-1-0
```

`mstsc` 连接即可

[sweet主题](https://links.jianshu.com/go?to=https%3A%2F%2Fwww.gnome-look.org%2Fp%2F1253385%2F)

```bash
cp sweet* /usr/share/themes
x Sweet-Dark
sudo add-apt-repository ppa:numix/ppa
# 若提示 apt-add-repository：找不到命令
# sudo apt-get install software-properties-common
# debconf: unable to initialize frontend: Dialog
# debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 76.)
# debconf: falling back to frontend: Readline
# sudo apt-get install dialog
sudo apt-get install numix-icon-theme-circle
```
