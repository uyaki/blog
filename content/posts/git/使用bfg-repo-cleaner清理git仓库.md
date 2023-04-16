---
title: 使用bfg Repo Cleaner清理git仓库
subtitle:
date: 2023-04-16T18:51:28+08:00
author:
  name: uyaki
  link: https://www.github.com/uyaki
  avatar: /images/avatar.png
description: 
keywords:
  - bfg
comment: true
weight: 0
tags:
  - git
categories:
  - git
hiddenFromHomePage: false
hiddenFromSearch: false
linkToMarkdown: true
summary:
toc: true
math: 
lightgallery: false
password:
message:
# 是否转载
repost:
  enable: false
  url:

# See details front matter: https://fixit.lruihao.cn/documentation/content-management/introduction/#front-matter
---

<!--more-->

## 用途
1. 上传了一些敏感文件(例如密码)
2. 上传了不想上传的文件(没及时或忘了加到.gitignore里的)
3. 上传了大文件

需要一个方法, 永久的删除这些文件(包括该文件的历史记录).

## 官网
[bfg-repo-cleaner](https://github.com/rtyley/bfg-repo-cleaner)
## 安装
1. 方式一：scoop 安装
```bash
scoop install bfg
scoop bucket add java
scoop install java/openjdk
```
2. 方式二：直接使用jar包

## 使用

## mirror克隆
```bash
git clone --mirror git://example.com/your-repo.git
```
### 使用方式

1. 删除大文件
```bash
bfg --strip-blobs-bigger-than 100M --replace-text banned.txt your-repo.git
```
2. 删除文件
```bash
## 单个文件
bfg --delete-files xxx.xx  your-repo.git
## 多个文件
bfg --delete-files {aaa,bbb}.xx  your-repo.git 
```
3. 删除文件夹
```bash
bfg --delete-folders your-folders 
```
4. 替换字符
```bash
bfg --replace-text expression-file.txt  your-repo.git
```
{{< admonition tip >}}

expression-file.txt 为密码替换模板文件

此文件中的每一行是一个匹配表达式。默认情况下，每一个表达式被视为一段文本常量，但你可以
1. 通过指定 regex: 前缀来说明此表达式是一个正则表达式
2. 指定 glob: 前缀。

每一个表达式的后面可以加上 `==>` 来指定匹配的文件应该被替换成什么（如果没有指定，就会被替换成默认值 `***REMOVED***` ）

```txt
# 密码：123456 字符串替换成 ***REMOVED***
密码：123456

# 密码：123456 字符串替换成 密码：******：
密码：123456 ==> 密码：******

# 使用正则表达式：
regex:密码：\d+ ==> 密码：******
```

{{< /admonition >}}

### 提交

1. 使用标准的`git gc`命令去除不需要的脏数据， git现在将这些脏数据视为多余的需求
```bash
cd your-repo.git
git reflog expire --expire=now --all && git gc --prune=now --aggressive
```

2. 提交
```bash
git push
```