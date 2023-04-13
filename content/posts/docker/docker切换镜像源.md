---
title: "Docker切换镜像源"
subtitle: 
date: 2020-02-11T10:57:01+08:00
draft: false
author:
  name: uyaki
  link: https://www.github.com/uyaki
  avatar: /images/avatar.png
description:
keywords: [ "加速","docker"]
license:
comment: true
weight: 0
tags:
  - docker 
categories:
  - docker
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

```sh
$ sudo mkdir -p /etc/docker
```

```sh
$ sudo tee /etc/docker/daemon.json <<-'EOF'

{

 "registry-mirrors": ["https://28ffkr6d.mirror.aliyuncs.com"]

}

EOF
```

```sh
$ sudo systemctl daemon-reload
```

```sh
$ sudo systemctl restart docker
```
![](https://cdn.jsdelivr.net/gh/uyaki/pic-cloud/img/20200221185223.png)
