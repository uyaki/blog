---
title: "Docker切换镜像源"
date: 2020-02-11T10:57:01+08:00
draft: false
keywords: [ "docker","镜像","加速"]
tags: ["docker","开发","加速"]
categories: ["docker","开发","加速"]
toc: false
---

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
![](https://cdn.jsdelivr.net/gh/uyaba/pic-cloud/img/20200221185223.png)
