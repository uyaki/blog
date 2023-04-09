---
title: "CentOS7开发环境"
subtitle: 
date: 2020-04-19T10:16:36+08:00
draft: false
author:
  name: uyaki
  link: https://www.github.com/uyaki
  avatar: /images/avatar.png
description:
keywords: 
license:
comment: false
weight: 0
tags:
  - server
categories:
  - server
hiddenFromHomePage: false
hiddenFromSearch: false
summary:
toc: true
math: false
lightgallery: false
password:
message:
repost:
  enable: false
  url: 

# See details front matter: https://fixit.lruihao.cn/documentation/content-management/introduction/#front-matter
---

<!--more-->

## 基础配置
### 修改主机名
```bash
# 查看一下当前主机名的情况
$ hostnamectl
$ hostnamectl set-hostname gakki --static
$ hostnamectl status
```
## 基础工具
```bash
# 解决ifconfig 不存在
$ yum -y install net-tools
# 文件传输
$ yum -y install lrzsz
$ yum install -y unzip zip
```

## docker安装
### 安装docker 
1. 新建`docker_install.sh`
2. 复制官方脚本[https://get.docker.com/](https://get.docker.com/) 内容
3. 安装与启动
```bash
## 授权
$ chmod docker_install.sh
## 安装
$ ./chmod docker_install.sh
## 移除脚本
$ rm docker_install.sh
## 启动
$ systemctl start docker.service
## 开机自启动
$ systemctl enable docker.service
```
4. 设置代理
```bash
$ vim /etc/docker/daemon.json
```
```
{
  "insecure-registries" : ["docker.server:80"],
  "debug" : true,
  "experimental" : true,
  "registry-mirrors": ["http://hub-mirror.c.163.com"]
}
```
### 安装docker-compose
参照[官网教程](https://docs.docker.com/compose/install/)
```bash
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
```
