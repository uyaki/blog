---
title: Alist整合Aria2Pro+AriaNg
subtitle:
date: 2024-01-12T03:24:47+08:00
author:
  name: uyaki
  link: https://www.github.com/uyaki
  avatar: /images/avatar.png
description:
keywords:
  - Alist
  - Aria2 Pro
  - AriaNg
comment: true
weight: 0
tags:
  - opensource
categories:
  - opensource
hiddenFromHomePage: false
hiddenFromSearch: false
linkToMarkdown: true
summary:
toc: true
math:
lightgallery: false
password:
message:
# 是否转载
repost:
  enable: false
  url:

# See details front matter: https://fixit.lruihao.cn/documentation/content-management/introduction/#front-matter
---

<!--more-->

{{< admonition info >}}
本文只介绍如何实现Alist整合Aria2Pro+AriaNg，具体Alist的用法，可以参照[官网文档](https://alist.nn.ci/zh/)
{{< /admonition >}}

## 前置准备

- [ ] 你的服务器、主机上需安装Docker和Docker Compose

## 部署

### 编写docker-compose.yml

```bash
mkdir -p ${your-docker-script-path}/alist
cd ${your-docker-script-path}/alist
vim docker-compose.yml
```

```yaml
version: "3.8"
services:
  # Alist 的官方部署文档: https://alist-doc.nn.ci/en/docs/install/docker/
  # docker run -d --restart=always -v /etc/alist:/opt/alist/data -p 5244:5244 --name="alist" xhofe/alist:latest
  alist:
    image: xhofe/alist:latest
    container_name: alist
    ports:
      - "5244:5244"
    restart: always
    volumes:
      - ${PWD}/alist:/opt/alist/data

  # Aria2 Pro 的官方部署文档: https://github.com/P3TERX/Aria2-Pro-Docker/blob/master/docker-compose.yml
  Aria2-Pro:
    container_name: aria2-pro
    image: p3terx/aria2-pro
    environment:
      - PUID=65534
      - PGID=65534
      - UMASK_SET=022
      # 在这里设置密钥
      - RPC_SECRET=YOUR_SECRET
      - RPC_PORT=6800
      - LISTEN_PORT=6888
      - DISK_CACHE=64M
      - IPV6_MODE=false
      - UPDATE_TRACKERS=true
      - CUSTOM_TRACKER_URL=
      - TZ=Asia/Shanghai
    volumes:
      - ${PWD}/aria2/config:/config
      - ${PWD}/aria2/downloads:/downloads
    network_mode: bridge
    ports:
      - "6800:6800"
      - "6888:6888"
      - "6888:6888/udp"
    restart: unless-stopped
    logging:
      driver: json-file
      options:
        max-size: 1m

  AriaNg:
    container_name: ariang
    image: p3terx/ariang
    command: --port 6880 --ipv6
    network_mode: bridge
    ports:
      - "6880:6880"
    restart: unless-stopped
    logging:
      driver: json-file
      options:
        max-size: 1m
```

### 启动

```bash
docker-compose up -d
```

### 设置Alist初始密码

用于alist web界面登录，默认账号为`admin`

```bash
docker exec -it alist ./alist admin set <your_password>
```

设置完成后，即可使用`http://${IP}:5244`登录

## 配置互联

### IP 地址与端口

{{< admonition tip >}}
最好不要用localhost或127.0.0.1来访问，否则两者之间的连接会出现问题，请使用主机的局域网IP来访问。
{{< /admonition >}}

以下是各种应用的访问端口，请将`${IP}`替换成你docker主机的IP地址：
| APP       | URL                 |
| --------- | ------------------- |
| Alist     | `http://${IP}:5244` |
| Aria2 RPC | `http://${IP}:6800` |
| AriaNg    | `http://${IP}:6880` |

### Alist 前端连接 Aria2 Pro

如下图所示，在Alist主页下方，依次点击`更多` -> `本地设置`

![](https://cdn.jsdelivr.net/gh/uyaki/pic-cloud/img/202401120448390.png)

在弹出的`本地设置`页中，配置如下选项

| 选项           | 配置内容                                       |
| -------------- | ---------------------------------------------- |
| Aria2 RPC 链接 | `http://${IP}:6800/jsonrpc`                    |
| Aria2 RPC 密钥 | `docker-compose.yaml`中的`Aria2-Pro:environment:RPC_SECRET` |

### Alist 后端连接 Aria2 Pro

在Alist主页下方点击`管理`，进入管理后台界面，依次点击`设置` -> `其他`

| 选项       | 配置内容                                       |
| ---------- | ---------------------------------------------- |
| Aria2 地址 | `http://${IP}:6800/jsonrpc`                    |
| Aria2 密钥 | `docker-compose.yaml`中的`Aria2-Pro:environment:RPC_SECRET` |

{{< admonition quote >}}
[两个Aria2有什么不同?](https://alist.nn.ci/zh/faq/why.html#%E4%B8%A4%E4%B8%AAaria2%E6%9C%89%E4%BB%80%E4%B9%88%E4%B8%8D%E5%90%8C)
{{< /admonition >}}

### 通过 AriaNg 查看和管理 Aria2 Pro 的下载任务

AriaNg 是 Aria2 Pro 的 Web UI，需要配置 Aria2 Pro 的 RPC 地址和 RPC 密钥，才能正常使用。

1. 从浏览器中访问`http://${IP}:6880/#!/settings/ariang`
2. 在Aria2 RPC Secret中设置你的RPC_SECRET，即`docker-compose.yaml`中的`Aria2-Pro:environment:RPC_SECRET`
3. 点击弹出的`重载`按钮便能完成配置

