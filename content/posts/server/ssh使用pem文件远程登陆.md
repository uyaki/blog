---
title: "SSH使用pem文件远程登陆"
subtitle: 
date: 2020-02-11T10:46:03+08:00
draft: false
author:
  name: uyaki
  link: https://www.github.com/uyaki
  avatar: /images/avatar.png
description:
keywords: 
license:
comment: true
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

## 方式一：

1. 修改pem权限；

   ```sh
   sudo chmod 600 key.pem
   ```

2. Mac OS 连接服务器使用 PEM 文件；

   ```sh
   ssh -i key.pem root@IP
   ```

## 方式二（Mac重启后失效）：

1. 使用ssh-add添加key文件；

   ```sh
   ssh-add -k key.pem  
   ```

2. 登陆；

   ```sh
   ssh root@IP
   ssh -p xxxx root@IP
   ```
