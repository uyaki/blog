---
title: "Mac系统下修改docker的vm参数"
date: 2020-02-17T14:10:15+08:00
draft: false
keywords: ["docker","macOS","vm参数"]
tags: ["docker","macOS"]
categories: ["docker","macOS"]
---

1. screen

```sh
screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty
```

会出现如下界面

![](https://cdn.jsdelivr.net/gh/uyaki/pic-cloud/img/20200217143600.png)


2. 键入`回车`，出现如下界面

![](https://cdn.jsdelivr.net/gh/uyaki/pic-cloud/img/20200217144718.png)

3. 像正常linux系统一样设置

```sh
sysctl -w vm.max_map_count=262144
```

4. 按`control+a`，再按`control+\` ，左下角出现退出提示后，按y确认退出

![](https://cdn.jsdelivr.net/gh/uyaki/pic-cloud/img/20200217144803.png)
