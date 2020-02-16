---
title: "ssh使用pem文件远程登陆"
date: 2020-02-11T10:46:03+08:00
draft: false
tags: ["ssh","认证"]
categories: ["ssh"]
---
## 方式一：

1. 修改pem权限；

   ```sh
   sudo chmod 600 key.pem
   ```

2. Mac OS 连接服务器使用 PEM 文件；

   ```sh
   ssh -i key.pem root@IP
   ```

## 方式二（Mac重启后失效）：

1. 使用ssh-add添加key文件；

   ```sh
   ssh-add -k key.pem  
   ```

2. 登陆；

   ```sh
   ssh root@IP
   ssh -p xxxx root@IP
   ```
