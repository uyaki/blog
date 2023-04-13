---
title: "Git删除 .DS_Store"
subtitle: 
date: 2020-02-11T11:16:29+08:00
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
  - git 
categories:
  - git
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
1. cd 到项目路径
2. 执行
   ```sh
   $ find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch
   ```
3. 插入到.gitignore
   ```sh
   $ echo .DS_Store >> .gitignore
   ``` 
4. git push

