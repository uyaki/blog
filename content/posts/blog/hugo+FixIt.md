---
title: Hugo+FixIt
subtitle:
date: 2023-04-09T19:56:03+08:00
author:
  name: uyaki
  link: https://www.github.com/uyaki
  avatar: /images/avatar.png
description: 
keywords:
  - 
comment: false
weight: 0
tags:
  - blog
  - hugo
categories:
  - blog
  - hugo
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

## hugo安装

```bash
# go安装
go install github.com/gohugoio/hugo@latest
# 如果需要支持Sass/SCSS 
# 1. 设置go变量CGO_ENABLED=1
# 2. 执行 -tags extended 
go install -tags extended github.com/gohugoio/hugo@latest
```
{{< notice notice-warning >}}

1. FixIt使用了Sass必须执行 `go install -tags extended github.com/gohugoio/hugo@latest`，否则会报错
2. 如果已经安装了hugo，一定要升级到新版本，旧版本有很多不兼容FixIt
{{</ notice >}}

## 建站

```bash
hugo new site blog
cd blog
git init 
git submodule add https://github.com/hugo-fixit/FixIt.git themes/FixIt
git submodule update
## 复制配置文件
mv config.toml config.old.toml
cp themes/FixIt/config.toml config.toml
```

## 修改 config.toml

最前面添加
```
title = ""
baseURL = ""
languageCode = "zh-cn"
defaultContentLanguage = "zh-cn"                             # en / zh-cn / ... (This field determines which i18n file to use)
# 是否包括中日韩文字
hasCJKLanguage = true

theme = "FixIt"
```

## config.toml 完整配置

[FixIt中文站](https://fixit.lruihao.cn/zh-cn/documentation/basics/)