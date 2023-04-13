---
title: "MacOS使用MacVim替代vim"
subtitle: 
date: 2020-02-11T11:06:59+08:00
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
```bash
## 安装macvim
brew install macvim

## 编辑配置文件
vim ~/.zshrc

## 添加
alias vi=vim
alias vim=mvim
alias mvim='/usr/local/bin/mvim -v'

## 生效
source ~/.zshrc
```
