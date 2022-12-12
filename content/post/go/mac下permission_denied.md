---
title: "Mac下go访问时出现permission_denied"
date: 2022-12-12T20:04:46+08:00
draft: false
keywords: [ "go", "mac", "goland" ]
tags: ["go", "mac", "goland"]
categories: ["go"]
---
# 解决 open /usr/local/go/pkg/darwin_amd64/runtime/cgo.a: permission denied

```bash
$ sudo chown -R [用户名] /usr/local/go/pkg/darwin_amd64/
$ whoami
uyaki
$ sudo chown -R uyaki /usr/local/go/pkg/darwin_amd64/
```
