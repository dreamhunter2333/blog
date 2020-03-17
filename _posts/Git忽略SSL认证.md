---
title: Git忽略SSL认证
date: 2020-03-17 22:58:37
categories: git
tags: git
---

## 使用http代理时，git克隆仓库报错

```bash
fatal: unable to access ‘https://github.com/........../‘: OpenSSL SSL_connect: SSL_ERROR_SYSCALL in connection to github.com:443
```

## 忽略SSL认证

* env命令设置GIT_SSL_NO_VERIFY环境变量为”ture”，并同时调用正常的git的clone命令，即在git里输入：

```bash
export GIT_SSL_NO_VERIFY=true
git clone https://host_name/git/project.git
```

* 一行使用

```bash
env GIT_SSL_NO_VERIFY=true git clone https://host_name/git/project.git
```

* 在clone完毕的仓库中将http.sslVerify设置为"false"：

```bash
git config http.sslVerify "false"
```
