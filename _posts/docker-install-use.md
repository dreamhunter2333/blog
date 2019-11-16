---
title: docker安装使用
date: 2019-08-13 23:47:04
tags: docker
categories: docker
---

## docker安装使用

### 安装,构建开发镜像

```bash
# windows下载安装即可
# mac
brew cask install docker

# 构建开发镜像
docker build -f Dockerfile -t demo:1.0 .
```

### Windows要创建localvolume

```bash
# Windows 需要创建 local volume
docker volume create --name demo-volume -d local
```

### 启动 停止

```bash
# 启动
docker-compose -f docker-compose.yaml up

# 停止
docker-compose -f docker-compose.yaml down
```

### docker查看镜像

```bash
docker images

docker image list
```

### docker查看容器

```bash
# 启动容器
docker start "ONTAINER ID"

# 停止容器
docker stop "ONTAINER ID"

# 启动的容器
docker ps

# 进入容器终端
docker exec -it "ONTAINER ID" /bin/bash

# 停止的容器
docker ps -a

# volume
docker volume ls
```
