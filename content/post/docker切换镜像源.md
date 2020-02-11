---
title: "Docker切换镜像源"
date: 2020-02-11T10:57:01+08:00
draft: false
tags: ["docker","加速"]
categories: ["docker"]
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
