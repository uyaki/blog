---
title: "SpringBoot设置项目热启动"
date: 2020-02-23T00:04:23+08:00
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
  - java 
categories:
  - java
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

## 导入jar包
```
'org.springframework.boot:spring-boot-devtools'
```
## 添加配置项
```yaml
devtools: #热部署
    restart:
      enabled: true
```

## 在idea开启
1. 如下图设置 `Build，Execution...->Compiler`，勾选 `Build project automatically`
![](https://cdn.jsdelivr.net/gh/uyaki/pic-cloud/img/20200223011604.png)
2. 快捷键 `commond+option+shift+'/'`，弹出`Maintenance`界面
![](https://cdn.jsdelivr.net/gh/uyaki/pic-cloud/img/20200223011708.png)
3. 点击`Registry`, 勾选compiler.automake.allow.when.app.running
![](https://cdn.jsdelivr.net/gh/uyaki/pic-cloud/img/20200223011808.png)
4. 重启项目

