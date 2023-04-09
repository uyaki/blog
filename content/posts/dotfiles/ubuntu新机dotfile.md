---
title: "Ubuntu新机dotfile"
subtitle: 
date: 2023-02-09T17:40:06+08:00
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
  - dotfiles 
categories:
  - dotfiles
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
# ubuntu-install

- [ubuntu-install](#ubuntu-install)
  - [使用 ssh连接服务器](#使用-ssh连接服务器)
  - [注册ssh到authorized\_keys](#注册ssh到authorized_keys)
  - [切换到管理员角色](#切换到管理员角色)
  - [Clone project](#clone-project)
  - [在本地安装字体（非必须）](#在本地安装字体非必须)
  - [安装clash（非必须）](#安装clash非必须)
  - [安装 ranger](#安装-ranger)

---

## 使用 ssh连接服务器

```sh
## 连接服务器
$ ssh -o ServerAliveInterval=180 -o ServerAliveCountMax=3 -o KeepAlive=yes [user]@[ip]
## 如果你是重装服务器可能还需要重置下ssh
$ ssh-keygen -R [ip]
```

---

## 注册ssh到authorized_keys

- 本机操作
```sh
$ cat ~/.ssh/id_rsa.pub
```

- 服务器操作
```sh
$ echo '<id_rsa.pub>' >> ~/.ssh/authorized_keys
```

> 注意，此时的ssh信息是在 `ubuntu` 用户下完成，如果需要 `root` 权限，需要切换到 `root` 执行

---

## 切换到管理员角色

```sh
## 切换到root下
$ sudo su
## `~` => `/root`
$ cd ~
```

---

## Clone project

```sh
$ git clone https://github.com/uyaki/dotfiles.git ~/dotfiles
```

> 文件默认操作路径 `/root/dotfiles`

```sh
$ cd dotfiles
$ sudo chmod 777 ./linux/*-install.sh
$ ./linux/ubuntu-install.sh
```

> 其实**不建议执行脚本**，因为执行过程过长，不利于问题及时解决。

> **建议手动安需复制执行语句执行**

---

## 在本地安装字体（非必须）

> 使用zsh主题[powerlevel10k](https://github.com/romkatv/powerlevel10k)，需要在客户端下载字体 [hack-nerd-font](https://github.com/ryanoasis/nerd-fonts)

具体查看：[字体字体安装教程](./../font/font.md)

如需修改 `powerlevel10k` 配置，执行：

```sh
$ p10k configure
```

---

## 安装clash（非必须）

具体查看：[clash in docker](./../clash_in_docker/clash_in_docker.md)

---

## 安装 ranger

具体查看：[ranger](./../ranger/ranger.md)