---
title: Run odoo in docker code-server
date: 2019-09-29 17:48:19
categories: docker
tags: 
    - docker
    - code-server
---

## Run odoo in docker code-server

![odoo-code_server-1](/imgs/code-server/odoo-code_server-1.jpg)

### 从 ubuntu18 构建镜像

[run-code-server-in-docker](http://jcstaff.club/2019/run-code-server-in-docker/)

### docker-compose

`docker-compose -f docker-compose.yml up`

```docker
version: '2'
services:
    odoo12_code_test:
        image: postgres:latest
        container_name: odoo12_code_test
        environment:
            - POSTGRES_DB=postgres
            - POSTGRES_USER=odoo
            - POSTGRES_PASSWORD=odoo
            - PGPORT=5433
        ports:
            - "54333:5433"
        volumes:
        # docker volume create --name code-postgresql-volume -d local
            - code-postgresql-volume:/var/lib/postgresql/data

    code_server:
        image: code_server:3.0
        container_name: code_server
        command: ./code-server
        depends_on:
            - odoo12_code_test
        environment:
            - HOST=odoo12_code_test
            - POSTGRES_USER=odoo
            - POSTGRES_PASSWORD=odoo
        ports:
            - "4000:4000"
            - "8070:8070"
            - "8080:8080"
        volumes:
            - ../:/opt/odoo

volumes:
    code-postgresql-volume:
        external: true
```
