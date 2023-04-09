---
title: "Steam如何绕过clash的全局代理"
subtitle: 
date: 2022-04-01T01:40:49+08:00
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
  - window
categories:
  - window
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
## 设置bypass

`Clash` -> `Settings` -> `System Proxy` -> `Bypass Domain/IPNet`

```yml
bypass:
  - localhost
  - 127.*
  - 10.*
  - 172.16.*
  - 172.17.*
  - 172.18.*
  - 172.19.*
  - 172.20.*
  - 172.21.*
  - 172.22.*
  - 172.23.*
  - 172.24.*
  - 172.25.*
  - 172.26.*
  - 172.27.*
  - 172.28.*
  - 172.29.*
  - 172.30.*
  - 172.31.*
  - 192.168.*
  - <local>
  - "*.bing.com"
  - "*.microsoft.com"
  - "*.bing.com"
  - "*.microsoft.com"
# Steam中国大陆地区游戏下载
  - "steampipe.steamcontent.tnkjmec.com" #华为云
  - "st.dl.eccdnx.com" #白山云
  - "st.dl.bscstorage.net"
  - "st.dl.pinyuncloud.com"
  - "dl.steam.clngaa.com" #金山云
  - "cdn.mileweb.cs.steampowered.com.8686c.com" #网宿云
  - "cdn-ws.content.steamchina.com"
  - "cdn-qc.content.steamchina.com" #腾讯云
  - "cdn-ali.content.steamchina.com" #阿里云
# Steam非中国大陆地区游戏下载/社区实况直播
  - "*.steamcontent.com"
# Battle.net战网中国大陆地区游戏下载
  - "client05.pdl.wow.battlenet.com.cn" #华为云
  - "client02.pdl.wow.battlenet.com.cn" #网宿云
# Epic Games中国大陆地区游戏下载
  - "epicgames-download1-1251447533.file.myqcloud.com"
# Rockstar Launcher客户端更新/游戏更新/游戏下载
  - "gamedownloads-rockstargames-com.akamaized.net"
```