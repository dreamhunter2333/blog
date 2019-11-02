---
title: Count code Lines by git log
date: 2019-11-03 00:34:42
categories: git 
tags: git 
---

## git log 代码统计

### 查看git上的某个人代码量

```bash
# username 为用户名
git log --author="username" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -
```

### 统计每个人增删行数

```bash
git log --format='%aN' | sort -u | while read name; do echo -en "$name\t"; git log --author="$name" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -; done
```

### 查看仓库提交者排名前 5

```bash
git log --pretty='%aN' | sort | uniq -c | sort -k1 -n -r | head -n 5
```

### 贡献值统计

```bash
git log --pretty='%aN' | sort -u | wc -l
```

### 添加或修改的代码行数

```bash
git log --stat|perl -ne 'END { print $c } $c += $1 if /(\d+) insertions/'
```
