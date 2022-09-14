---
title: "Git删除 .DS_Store"
date: 2020-02-11T11:16:29+08:00
draft: false
keywords: ["git",".DS_Store"]
tags: ["git"]
categories: ["git"]
toc: false
---

1. cd 到项目路径
2. 执行
   ```sh
   $ find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch
   ```
3. 插入到.gitignore
   ```sh
   $ echo .DS_Store >> .gitignore
   ``` 
4. git push

