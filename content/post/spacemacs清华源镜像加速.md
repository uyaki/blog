---
title: "Spacemacs清华源镜像加速"
date: 2020-02-11T13:48:32+08:00
draft: false
keywords: ["镜像","加速","Spacemacs"]
tags: ["软件","加速","Spacemacs"]
categories: ["软件","加速","Spacemacs"]
---
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
