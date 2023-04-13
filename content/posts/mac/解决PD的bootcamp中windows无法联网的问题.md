---
title: "解决PD的bootcamp中windows无法联网的问题"
subtitle: 
date: 2022-04-01T15:25:29+08:00
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
## 解决无法联网的问题:

```sh
vim /Library/Preferences/Parallels/network.desktop.xml
```

```xml
<!-- <UseKextless>-1</UseKextless>改为 1-->
<UseKextless>0</UseKextless>
```


解决USB无法识别问题:
```sh
vim /Library/Preferences/Parallels/dispatcher.desktop.xml
```
```xml
<!-- 找到 <Usb>0</Usb> ，修改为 1 -->
<Usb>1</Usb>
```

修改后，重启 Parallels Desktop以及windows，即完美解决以上问题。