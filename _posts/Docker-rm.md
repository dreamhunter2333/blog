---
title: Docker rm
date: 2019-10-12 09:44:25
categories: docker
tags: docker
---

## Docker rm

### docker 删除所有未使用数据

```bash
docker system prune
```

### docker 删除所有未使用镜像

```bash
docker image prune
```

### docker 停止所有容器

```bash
docker stop $(docker ps -q)
```

### docker 删除所有容器

```bash
docker rm $(docker ps -aq)
```

### docker 删除所有未使用容器

```bash
docker container prune
```

### docker 删除未使用所有卷

```bash
docker volume prune
docker volume rm $(docker volume ls -qf dangling=true)
```
