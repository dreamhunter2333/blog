---
title: 在windows的linux子系统中运行Odoo12
date: 2019-08-25 21:18:02
tags: 
    - odoo
    - linux
    - wsl
categories:
    - [odoo]
    - [linux]
---

# 在windows的linux子系统中运行Odoo12

## 首先肯定是安装linux子系统

> 首先去程序与功能，打开`linux`子系统  
> ![](/imgs/wsl/wsl1.png)

> 可能会要求重启，之后打开微软商店，搜索`linux`  
> 安装一个linux发行版，这里我选了`Ubuntu18`
> ![](/imgs/wsl/wsl2.png)

> 漫长等待之后，在弹出的终端界面输入用户名密码
> 安装完成

## Ubuntu的系统配置

```bash
sudo apt update && sudo apt upgrade
 # 安装 postgresql
sudo apt install postgresql -y
sudo su -c "createuser -s $USER" postgres
# 开启数据库
sudo service postgresql start
# 关闭数据库
sudo service postgresql stop
# 安装依赖
sudo apt update && sudo apt upgrade
sudo apt install git -y
sudo apt install python3-dev python3-pip -y
sudo apt install build-essential libxslt-dev libzip-dev libldap2-dev libsasl2-dev libssl-dev -y
```

## 下载社区版odoo12源码

```bash
# windows 磁盘在linux子系统中映射在/mnt/下
# 这里将odoo clone到f盘odoo12下
cd /mnt/f/odoo12
git clone https://github.com/odoo/odoo.git
# 使用清华源快速安装依赖
sudo pip3 install -r odoo/requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
pip3 install num2words phonenumbers psycopg2-binary watchdog xlwt -i https://pypi.tuna.tsinghua.edu.cn/simple
```

## 启动odoo12

### 启动测试

```bash
# 就可以启动默认的odoo12
odoo/odoo-bin
```

### 数据库配置

```bash
# 切换到数据库超级用户
sudo -i -u postgres
# 进入数据库
psql
# 创建用户
CREATE ROLE odoo WITH SUPERUSER LOGIN PASSWORD 'odoo';
```

### 创建conf参数文件

> 在`odoo12`目录下创建`odoo.conf`
```conf
[options]
admin_passwd = admin
db_host = localhost
db_port = 5432
db_user = odoo
db_password = odoo
addons_path = /mnt/f/odoo12/odoo/addons
```

### 带参数启动odoo-bin

```bash
# -c xxx 配置文件
# -d xxx 新建数据库
# -i 安装模块
# -–stop-after-init 在执行结束后停止服务
odoo/odoo-bin -c odoo.conf -d demo -i base -–stop-after-init
# 配置文件启动
odoo/odoo-bin -c odoo.conf
```

## 在pycharm中调试代码

> 之前的`odoo12`文件夹就是我们的工程目录
> 使用pycharm专业版打开，添加如下的解释器
> ![](/imgs/wsl/wsl3.png)
> 会自动把工程路径按照 `F:/ to /mnt/f/` 这种关系映射
> 然后配置odoo-bin的启动参数
> ![](/imgs/wsl/wsl4.png)

```bash
# 若此前跑过odoo-bin命令 需要终止
ps -ef
# 找到需要终止的任务的PID，比如2333
kill 2333
# 杀死所有python3
killall python3
```

> 然后就可以本机调试了
> 子系统的网络地址就是本机，不用像`docker`一样配置