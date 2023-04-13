---
title: "MacOS在iTerm中使用rz、sz从远程上传下载文件"
subtitle: 
date: 2020-02-11T10:49:09+08:00
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
## 安装
### 下载安装lrzsz，创建软连接（mac）

```sh
sudo brew install lrzsz

ln -s /usr/local/Cellar/lrzsz/0.12.20/bin/sz

ln -s /usr/local/Cellar/lrzsz/0.12.20/bin/rz
```

说明：lrzsz在本地和远程主机均要安装！


### 下载并安装automatic zmoderm for iTerm2

```sh
cd usr/local/bin

sudo wget https://raw.github.com/mmastrac/iterm2-zmodem/master/iterm2-send-zmodem.sh

sudo wget https://raw.github.com/mmastrac/iterm2-zmodem/master/iterm2-recv-zmodem.sh

sudo chmod 777 /usr/local/bin/iterm2-*
```

脚本地址：[https://github.com/mmastrac/iterm2-zmodem](https://github.com/mmastrac/iterm2-zmodem)


### 添加iTerm2 trigger

> iTerm2 --> Profiles --> Open Profiles --> Edit Profiles --> Advanced --> Edit Trigger

配置项：

| Regular expression    | Action               | Parameters                           |
| --------------------- | -------------------- | ------------------------------------ |
| `\*\*B0100`           | Run Silent Coprocess | /usr/local/bin/iterm2-send-zmodem.sh |
| `\*\*B00000000000000` | Run Silent Coprocess | /usr/local/bin/iterm2-recv-zmodem.sh |

## 使用方法

### 将文件传到远端服务器

1. 在远端服务器上输入 `rz` ，回车；
2. 选择本地要上传的文件；
3. 等待上传；


### 从远端服务器下载文件

1. 在远端服务器输入`sz filename filename1 … filenameN`；
2. 选择本地的存储目录；
3. 等待下载；
