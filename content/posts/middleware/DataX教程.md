---
title: "DataX教程"
subtitle: 
date: 2020-03-19T09:46:31+08:00
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
  - 中间件 
categories:
  - 中间件
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
## 安装

```sh
$ git clone git@github.com:alibaba/DataX.git
```

```sh
$ cd DataX
$ vim pom.xml
```

> 注释掉不需要的reader、writer`<module>`标签

```sh
mvn -U clean package assembly:assembly -Dmaven.test.skip=true
```

## 使用
