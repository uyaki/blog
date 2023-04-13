---
title: "Goland在go_modules模式下无法识别本地依赖包"
subtitle: 
date: 2022-12-12T20:47:16+08:00
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
  - go 
categories:
  - go
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
如下图所示，设置 go -> Go Modules -> ✅ Enable Go modules integration -> Environment: 输入 `GOPROXY=https://goproxy.cn,direct`
![](https://cdn.jsdelivr.net/gh/uyaki/pic-cloud/img/20221212205112.png)