---
title: Linux终端下使用酸酸乳
date: 2019-03-31 01:00:01
categories: linux
tags:
    - 酸酸乳
    - ssr
---

### 一、克隆或者直接下载ssr

``` bash
git clone https://github.com/jinmu333/shadowsocksr.git
```
### 二、在Linux下使用

**克隆或下载好之后，打开 shadowsocksr 文件夹，找到 config.json 配置文件，在这里填写好你相应的节点信息**

``` bash

# 修改好之后，打开你的终端，进入 shadowsocksr 文件夹 (根据自己所处的路径):
cd shadowsocksr/

# 然后将 runssr 和 stopssr 两个脚本修改为可执行文件并移动到 /usr/local/bin/ 目录下，这样将其添加到了环境变量中，以后输入命令就可执行:
chmod 755 runssr stopssr
sudo mv runssr stopssr /usr/local/bin

# 将整个项目文件移动到 /opt/ 目录下 (假设此时还是在 shadowsocksr 下)：
cd ..
sudo mv shadowsocksr/ /opt/

# 最后，只需要激活一下环境变量：
source /etc/profile

```

### 三、打开 SSR/关闭 SSR

``` bash

# 现在，你就可以使用如下命令来随意地打开或关闭 SSR。
runssr
stopssr

```

经过上面一通操作之后，如果以后需要修改节点信息，其配置文件在如下位置：

``` bash

/opt/shadowsocksr/config.json

/opt/shadowsocksr/shadowsocks/ssserver.log

```

### 四、在Linux终端使用SSR服务

``` bash

# Privoxy 配置
apt install -y privoxy

# 全局模式，将所有http/https请求走代理服务，全局代理按照如下操作即可。
# 添加本地ssr服务到配置文件
echo 'forward-socks5 / 127.0.0.1:1080 .' >> /etc/privoxy/config

# Privoxy 默认监听端口是是8118
export http_proxy=http://127.0.0.1:8118
export https_proxy=http://127.0.0.1:8118
export no_proxy=localhost

# 启动服务
systemctl start privoxy.service

```
