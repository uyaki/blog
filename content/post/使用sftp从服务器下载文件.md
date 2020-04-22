---
title: "使用sftp从服务器下载文件"
date: 2020-04-22T10:54:52+08:00
draft: false
keywords: [ "", "" ]
tags: [""]
categories: [""]
---
## sftp
交互式的文件传输程序，命令的运行和使用方式与 ftp 命令相似，但是，sftp 命令对传输的所有信息使用 ssh 加密，它还支持公钥认证和压缩等功能。
## 语法
```
sftp(选项)(参数)
```
### 选项
```
-B：指定传输文件时缓冲区的大小；
-l：使用ssh协议版本1；
-b：指定批处理文件；
-C：使用压缩；
-o：指定ssh选项；
-F：指定ssh配置文件；
-R：指定一次可以容忍多少请求数；
-v：升高日志等级。
```
### 参数
```
目标主机：指定 sftp 服务器 ip 地址或者主机名。
```
### 示例
```bash
$ sftp -Pport user@ip
```
## 下载

```bash
# cd到服务器指定目录
sftp> cd xxx
# 本地cd到要下载的目标位置
sftp> lcd ~/Downloads
# 下载
sftp> get -r ./* ./
```
