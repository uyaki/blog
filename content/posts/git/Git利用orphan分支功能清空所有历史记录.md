---
title: "Git利用orphan分支功能清空所有历史记录"
subtitle: 
date: 2020-02-19T09:44:59+08:00
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
## 目的

清空git项目，获得一个没有历史记录的空项目

## 实现

```sh 
## 创建一个orphan分支
$ git checkout --orphan tmp_branch
## 给爷爬~~~~
$ git rm -rf .
## TODO 加一些文件
$ ... 
## 提交
$ git add .
$ git commit -am "commit message"
## 删除master分支
$ git branch -D master
## 重命名当前分支为master
$ git branch -m master
## 强制推送到远程
$ git push -f origin master
```

## tips📌

### git push -f无权限问题
可能会出现无法强制推送的BUG：

```
You are not allowed to force push code to a protected branch on this project
```

配置下Git远程（在 Settings 的 Repository 设置项的 Protected Branches)

展示移除保护，之后恢复就行。

### --orphan其他用途
可以用于创建一个跟master无关的分支，使一个git管理不同的项目，找个时间再单独开个贴写吧，哈哈哈哈哈
