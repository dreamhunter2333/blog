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
RUN apt-get install python3 python3-pip python3-pypdf2 screenfetch git -y
RUN apt-get update -y && apt-get upgrade -y
ENV SHELL=/bin/zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" -y
RUN apt-get install build-essential libxslt-dev libzip-dev libldap2-dev libsasl2-dev libssl-dev -y
RUN apt-get update -y && apt-get upgrade -y
COPY ./requirements.txt /opt/
RUN python3 -m pip install -r /opt/requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple && \
    rm -rf /opt/requirements.txt
RUN python3 -m pip install autopep8 num2words phonenumbers psycopg2-binary watchdog xlwt pylint -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install nodejs npm -y
RUN apt-get update -y && apt-get upgrade -y

RUN npm set registry https://registry.npm.taobao.org/ && \
    # npm install -g hexo-cli && \
    # npm install -g rtlcss && \
    npm install -g jshint

# RUN curl -o wkhtmltox.deb -sSL https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb \
#     && echo '7e35a63f9db14f93ec7feeb0fce76b30c08f2057 wkhtmltox.deb' | sha1sum -c - \
#     && apt-get install -y --no-install-recommends ./wkhtmltox.deb \
#     && rm -rf /var/lib/apt/lists/* wkhtmltox.deb

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
