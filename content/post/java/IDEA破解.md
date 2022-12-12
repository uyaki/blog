---
title: "IDEA破解"
date: 2020-02-17T15:00:39+08:00
draft: true
keywords: ["idea","破解"]
tags: ["软件","idea"]
categories: ["软件","idea"]
---

## 声明

本人是idea开源作者，可以在合理的范围内使用正版idea，此方法只供需要的人了解学习使用

## 方法
```sh
$ vim /Applications/IntelliJ\ IDEA.app/Contents/MacOS
# q 退出
$ vim ~/Library/Preferences/IntelliJIdea2019.3/idea.vmoptions
# 末尾插入
-javaagent:{jb-agent-path}
```
