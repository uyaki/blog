---
title: "IDEA破解"
date: 2020-02-17T15:00:39+08:00
draft: true
keywords: ["idea","破解"]
tags: ["idea"]
categories: ["Idea"]
---


```sh
$ vim /Applications/IntelliJ\ IDEA.app/Contents/MacOS
# q 退出
$ vim ~/Library/Preferences/IntelliJIdea2019.3/idea.vmoptions
# 末尾插入
-javaagent:{jb-agent-path}
```
