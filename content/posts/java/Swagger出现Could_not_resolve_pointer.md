---
title: "Swagger出现Could not resolve pointer"
subtitle: 
date: 2020-03-04T11:29:31+08:00
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

## 问题描述

![](https://cdn.jsdelivr.net/gh/uyaki/pic-cloud/img/20200304113107.png)

## 原因

类上的注解 “/” 的问题

@ApiModel(不能使用“/”)

