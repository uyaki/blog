---
title: "DataX教程"
date: 2020-03-19T09:46:31+08:00
draft: false
keywords: [ "DataX", "" ]
tags: ["开发"]
categories: ["开发"]
---

## 安装

```sh
$ git clone git@github.com:alibaba/DataX.git
```

```sh
$ cd DataX
$ vim pom.xml
```

> 注释掉不需要的reader、writer`<module>`标签

```sh
mvn -U clean package assembly:assembly -Dmaven.test.skip=true
```

## 使用
