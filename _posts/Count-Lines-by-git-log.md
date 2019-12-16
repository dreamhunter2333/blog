---
title: Count code Lines by git log
date: 2019-12-15 00:34:42
categories: git 
tags: git 
---

## git log 代码统计

### git统计代码量脚本

* 保存为`.sh`脚本查看指定人的代码行数以及行数和

```bash
#!/bin/bash
echo -e "\n-------------------git log start-------------------\n"
names=(demo demo2)
added=0
removed=0
totaled=0
for name in ${names[*]};
do
echo -en "$name";
    eval $(git log --author="$name" --pretty=tformat: --since==2019-12-8 --until=2019-12-14 --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf("add=%s, remove=%s, total=%s", add, subs, loc)}' -);
    echo ": added lines: $add removed lines: $remove total lines: $total"
    let added+=${add::-1}
    let removed+=${remove::-1}
    let totaled+=$total
done
echo -e "\nAll:  added lines: $added, removed lines: $removed, total lines: $totaled"
echo -e "\n------------------------end------------------------"
```

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
