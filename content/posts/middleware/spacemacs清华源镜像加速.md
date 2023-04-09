---
title: "Spacemacs清华源镜像加速"
subtitle: 
date: 2020-02-11T13:48:32+08:00
draft: false
author:
  name: uyaki
  link: https://www.github.com/uyaki
  avatar: /images/avatar.png
description:
keywords: 
license:
comment: false
weight: 0
tags:
  - 中间件 
  - 加速
categories:
  - 中间件
hiddenFromHomePage: false
hiddenFromSearch: false
summary:
toc: true
math: false
lightgallery: false
password:
message:
repost:
  enable: false
  url: 

# See details front matter: https://fixit.lruihao.cn/documentation/content-management/introduction/#front-matter
---

<!--more-->
## 核心配置

添加下面的代码到`.spacemacs`或`~/.spacemacs/init.el` 的`dotspacemacs/user-init()`下

```elpa
(setq configuration-layer-elpa-archives
    '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
      ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
      ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
```

## 巨人肩膀
[清华镜像源elpa使用帮助](https://mirror.tuna.tsinghua.edu.cn/help/elpa/)
