---
title: "使用GitHub和PicGo搭建个人图床"
date: 2020-02-12T01:02:04+08:00
draft: false
tags: ["blog","图床"]
categories: ["图床"]
---

## Github操作

### 新建repository作为图床地址

![](https://cdn.jsdelivr.net/gh/gknoone/pic-cloud/img/20200212013241.png)

### 创建token

1. 访问 [https://github.com/settings/tokens](https://github.com/settings/tokens)，点击`Generate new token`；
2. 把 repo 的勾打上即可。然后翻到页面最底部，点击 Generate token 的绿色按钮生成 token；
3. 复制生成的token；

![](https://cdn.jsdelivr.net/gh/gknoone/pic-cloud/img/20200212013757.png)

## PicGo配置

### 安装

1. 从[PicGo官方](https://github.com/Molunerfinn/PicGo)下载最新版本；
2. 使用[jsDelivr](https://www.jsdelivr.com/?docs=gh)进行CDN加速，设置自定义域名如下`https://cdn.jsdelivr.net/gh/gknoone/pic-cloud`；

完整配置如下:
![](https://cdn.jsdelivr.net/gh/gknoone/pic-cloud/img/20200216202445.png)



### 使用

1. 截图
2. 使用全局快捷键`command+shift+P`上传到配置好的图床；
3. 等待上传完成，自动复制到剪切板；

## 巨人肩膀

- [PicGo Github地址](https://github.com/Molunerfinn/PicGo)

- [PicGo中文使用文档](https://picgo.github.io/PicGo-Doc/zh/guide/)

- [jsDelivr官网](https://www.jsdelivr.com/?docs=gh)
