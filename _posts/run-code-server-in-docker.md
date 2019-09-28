---
title: code-server在线编辑器 in docker
date: 2019-09-28 13:55:36
categories: docker
tags: 
    - docker
    - code-server
---

## code-server在线编辑器 in docker

### 从 ubuntu18 构建镜像

编写 `Dockerfile`

```Dockerfile
FROM ubuntu:latest
LABEL author=jinmu333
# 使用阿里源
RUN sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list && \
    sed -i s/security.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list
# 安装依赖
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y locales
RUN locale-gen zh_CN
RUN locale-gen zh_CN.utf8
RUN update-locale LANG=zh_CN.UTF-8 LC_ALL=zh_CN.UTF-8 LANGUAGE=zh_CN.UTF-8
RUN apt-get update -y && apt-get upgrade -y

ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8

RUN apt-get install sudo vim curl zsh wget -y
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install python3 python3-pip screenfetch git -y
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install nodejs npm -y
RUN apt-get update -y && apt-get upgrade -y

RUN npm set registry https://registry.npm.taobao.org/ && \
    npm install -g hexo-cli
# 新建用户 admin
RUN useradd --create-home --no-log-init --shell /bin/bash admin && \
    adduser admin sudo && \
    echo 'admin:admin' | chpasswd

# 下载 code-server
RUN cd /opt/ && \
    wget -c https://github.com/cdr/code-server/releases/download/2.1523-vsc1.38.1/code-server2.1523-vsc1.38.1-linux-x86_64.tar.gz && \
    tar zxvf code-server2.1523-vsc1.38.1-linux-x86_64.tar.gz && \
    mv code-server2.1523-vsc1.38.1-linux-x86_64 code-server

# 创建目录 权限 777
RUN mkdir /opt/hexo && \
    chmod -R 777 /opt && \
    chmod -R 777 /home/admin

USER admin
# 下载 vscode python插件
RUN cd /opt/code-server && \ 
    wget -c https://github.com/Microsoft/vscode-python/releases/download/2019.9.34911/ms-python-release.vsix

WORKDIR /opt/code-server
```

```bash
# build image
docker build -f Dockerfile -t code_server:1.0 .
```

### docker-compose 启动 code-server

编写 `docker-compose.yml`

```docker 
version: '2'
services:
    code_server:
        image: code_server:1.0
        container_name: code_server
        command: ./code-server
        ports:
            - "4000:4000"
            - "8080:8080"
```

启动 `docker-compose`

```bash
docker-compose -f docker-compose.yml up
```

### 访问 localhost:8080

![code-server](/imgs/code-server/code_server.jpg)
