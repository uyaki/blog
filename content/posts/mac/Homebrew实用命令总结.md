---
title: "Homebrew实用命令总结"
subtitle: 
date: 2020-02-23T01:23:11+08:00
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
  - macOS 
categories:
  - macOS
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
## 更新Homebrew

```sh
$ brew update
```

## 查看哪些包可以更新

```sh
$ brew outdated
```

## 更新包 (formula)

> Homebrew 会安装新版本的包，但旧版本仍然会保留。

```sh
$ brew upgrade             # 更新所有的包
$ brew upgrade $FORMULA    # 更新指定的包
```

## 清理旧版本

> Homebrew 只会清除比当前安装的包更老的版本，所以不用担心有些包没更新但被删了。

```sh
$ brew cleanup             # 清理所有包的旧版本
$ brew cleanup $FORMULA    # 清理指定包的旧版本
$ brew cleanup -n          # 查看可清理的旧版本包，不执行实际操作
```

## 锁定不想更新的包

> 但我们有时候会担心自动升级把一些不希望更新的包更新了。数据库就属于这一类，尤其是 PostgreSQL 跨 minor 版本升级都要迁移数据库的。我们更希望找个时间单独处理它。这时可用 brew pin 去锁定这个包，然后 brew update 就会略过它了。

```sh
$ brew pin $FORMULA      # 锁定某个包
$ brew unpin $FORMULA    # 取消锁定
```

## 查看包的相关信息

```sh
$ brew info $FORMULA    # 显示某个包的信息
$ brew info             # 显示安装了包数量，文件数量，和总占用空间
```

## 显示包的依赖关系

```sh
$ brew deps --installed --tree # 查看已安装的包的依赖，树形显示
```
