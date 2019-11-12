---
title: code-server在线编辑器 in docker
date: 2019-09-28 13:55:36
cover_img: /imgs/code-server/code_server.jpg
categories: docker
tags: 
    - docker
    - code-server
---

## code-server在线编辑器 in docker

### 从 ubuntu18 构建镜像

<p class="success"> 编写Dockerfile</p>

```Dockerfile
FROM ubuntu:latest
LABEL author=jinmu333
# 使用阿里源
RUN sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list && \
    sed -i s/security.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y locales
RUN locale-gen zh_CN
RUN locale-gen zh_CN.utf8
RUN update-locale LANG=zh_CN.UTF-8 LC_ALL=zh_CN.UTF-8 LANGUAGE=zh_CN.UTF-8
RUN apt-get update -y && apt-get upgrade -y

ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8

RUN apt-get install sudo vim curl zsh wget nano psmisc -y
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install python3 python3-pip screenfetch git -y
RUN apt-get update -y && apt-get upgrade -y
ENV SHELL=/bin/zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" -y
RUN apt-get update -y && apt-get upgrade -y

USER root

WORKDIR /opt/odoo
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
