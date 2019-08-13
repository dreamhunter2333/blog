---
title: docker安装使用
date: 2019-08-13 23:47:04
tags: docker
categories: docker
---

## docker安装使用

```bash
# windows下载安装即可
# mac
brew cask install docker

# 构建开发镜像
docker build -f ./Dockerfile -t debian:sketch .
```

```bash
# Windows 需要创建 local volume
# docker volume create --name pscloud-postgresql-volume -d local
```

```bash
# 启动
# windows:
docker-compose -f docker-compose-win.yaml up
# linux/mac:
docker-compose -f docker-compose.yaml up

# 停止
# windows:
docker-compose -f docker-compose-win.yaml down
# linux/mac:
docker-compose -f docker-compose.yaml down
```
