---
title: "IDEA破解"
subtitle: 
date: 2020-02-17T15:00:39+08:00
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
## 声明

本人是idea开源作者，可以在合理的范围内使用正版idea，此方法只供需要的人了解学习使用

## 方法
```sh
$ vim /Applications/IntelliJ\ IDEA.app/Contents/MacOS
# q 退出
$ vim ~/Library/Preferences/IntelliJIdea2019.3/idea.vmoptions
# 末尾插入
-javaagent:{jb-agent-path}
```
