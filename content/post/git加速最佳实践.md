---
title: "Git加速最佳实践"
date: 2020-02-11T09:25:55+08:00
draft: false
tags: ["git","工具","proxy"]
categories: ["git","工具","proxy","加速"]
---
## Git支持的协议

- https协议，`https://`协议需要配置`git`的`http.proxy`参数
- ssh协议，`ssh://`协议需要配置`ssh`的`ProxyCommand`参数

## 针对HTTPS协议配置代理

### 通过命令方式

- 针对所有git服务器设置代理（这里演示使用socks5端口）

```sh
$ git config --global http.proxy=socks5://127.0.0.1:1086
$ git config --global https.proxy=socks5://127.0.0.1:1086
```

- 只针对github.com设置代理（这里演示使用http端口）

```sh
$ git config --global http.https://github.com.proxy http://127.0.0.1:1087
```

- 如果代理需要账号密码

```sh
$ git config --global http.proxy http://<proxyuser>:<proxypwd>@<proxy.server.com>:<proxy.server.port>
```

### 通过编辑git配置文件的方式

```sh
$ vim ~/.gitconfig

[http]
	proxy = socks5://127.0.0.1:1086
[https]
	proxy = socks5://127.0.0.1:1086
```

## 针对ssh协议配置代理

1. 安装[connect](https://bitbucket.org/gotoh/connect)，connect是一个工具，用户代理的转换。

**macOS安装方式**：

```sh
$ brew install connect
```

2. `ProxyCommand`命令设置

```sh
$ vim ~/.ssh/config

Host github.com .github.com
    ProxyCommand connect -H 127.0.0.1:1087 %h %p #设置http代理
    HostName %h
    Port 22
    User git
    IdentityFile  ~/.ssh/id_rsa # 这里是私钥，不要放成公钥啦
    IdentitiesOnly yes
```

3. 测试

```sh
$ ssh -T git@github.com

Hi username! You ve successfully authenticated, but GitHub does not provide shell access.
```
## tips📌

### 取消代理

```sh
$ git config --global --unset http.proxy 
$ git config --global --unset https.proxy
```

### 查看当前代理
```sh
$ git config --global --get http.proxy
$ git config --global --get https.proxy
```

### 查看所有git全局配置
```sh
$ git config --global -l
```

## 巨人的肩膀
[https://www.hi-linux.com/posts/11850.html](https://www.hi-linux.com/posts/11850.html)
