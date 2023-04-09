---
title: "Mac下go访问时出现permission_denied"
subtitle: 
date: 2022-12-12T20:04:46+08:00
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
# 解决 open /usr/local/go/pkg/darwin_amd64/runtime/cgo.a: permission denied

```bash
$ sudo chown -R [用户名] /usr/local/go/pkg/darwin_amd64/
$ whoami
uyaki
$ sudo chown -R uyaki /usr/local/go/pkg/darwin_amd64/
```
