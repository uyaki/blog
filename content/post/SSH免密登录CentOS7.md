---
title: "SSH免密登录CentOS7"
date: 2020-04-19T14:21:48+08:00
draft: false
keywords: [ "ssh", "centos7" ]
tags: ["ssh","centos7"]
categories: ["ssh"]
---

## 本机传送id_rsa.pub

```bash
$ scp .ssh/id_rsa.pub user@ip:/root/id_rsa.pub
```

## 服务器

```bash
$ cat id_rsa.pub >> .ssh/authorized_keys
$ chmod 700 .ssh
$ chmod 600 .ssh/authorized_keys

```

## 服务器额外配置（centos7.4以下）

```bash
$ vim /etc/ssh/sshd_config
```

> 如下配置，7.4及更高版本不需要

```
RSAAuthentication yes
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys
```

## 重启服务

```bash
$ service ssh restart
```

## 本机登录

### 方式一：用户名@IP

```bash
$ ssh user@ip
```

### 方式二：别名

配置`.ssh/config`

```
Host xxx # 别名
Hostname xxx.xxx.xxx.xxx # ip
Port 22
User xxx # 用户名
IdentityFile ~/.ssh/id_rsa
```

```bash
$ ssh xxx
```

