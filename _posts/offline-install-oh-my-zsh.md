---
title: offline install oh-my-zsh
date: 2019-10-23 16:40:54
categories: linux
tags: linux
---

## 离线安装 oh-my-zsh

### 下载 deb oh-my-zsh

[下载对应版本的 `zsh-common` `zsh`](http://archive.ubuntu.com/ubuntu/pool/main/z/zsh/)
将 `zsh-common_5.1.1-1ubuntu2.3_all.deb` `zsh_5.1.1-1ubuntu2.3_amd64.deb` 拷贝

```bash
# 下载并拷贝到 ~/.oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
```

### 安装 zsh

```bash
dpkg -i zsh-common_5.1.1-1ubuntu2.3_all.deb zsh_5.1.1-1ubuntu2.3_amd64.deb
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
```

### 启动 zsh

```bash
/bin/zsh
```

### vscode 默认终端

```json
{
"terminal.integrated.shell.linux": "/bin/zsh",
}
```
