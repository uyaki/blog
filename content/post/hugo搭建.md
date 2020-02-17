---
title: "Hugo搭建"
date: 2020-02-06T21:56:02+08:00
draft: false
tags: ["hugo","blog","install"]
categories: ["Hugo"]
---
# 使用 Hugo 搭建博客

## hugo 安装

依赖：
- Git
- Mercurial
- Go

Mac 下直接使用 Homebrew 安装：

```sh
$ brew install hugo
```

## github仓库准备

1. create new repositories => `blog` ，用来存放网站内容和源文件；
2. create new repositories => `<username>.github.io` ，用于存放最终发布的网站内容；

## 生成站点

使用 Hugo 快速生成站点

```sh
$ hugo new site /path/to/site
## 如我的项目名叫blog
$ hugo new site blog 
```

cd 到 站点文件夹

```sh
$ cd blog
$ tree -d -L 1
.
├── archetypes
├── content
├── data
├── layouts
├── resources
├── static
└── themes
```

- archetypes 使用 hugu new post 生成新文章的模板，可以自定义里面的值
- content 存放网站内容
- data 存储 Hugo 在生成您的网站时可以使用的配置文件
- layouts 以.html 文件的形式存储模板，指定如何将内容的视图呈现到静态网站中
- static 存储所有静态内容：图像，CSS，JavaScript 等，当 Hugo 构建您的站点时，静态目录中的所有资产都将按原样复制
- themes 存放主题
- config.toml 配置文件

## 添加主题

到[hugo-theme-even](https://github.com/olOwOlo/hugo-theme-even.git)下fork项目

```sh
## 初始化
$ git init
## 关联远程 blog 仓库
$ git remote add origin git@github.com:gknoone/blog.git
$ git submodule add https://github.com/gknoone/hugo-theme-even.git themes/even
```

下载完后，找到主题目录 `/themes/even/exampleSite` 下的配置文件 `config.toml`，将该文件复制到根目录下，替换根目录的 `config.toml`，根据需求更改配置文件即可。

## 启动hugo服务

```sh
$ hugo server -D
```

## 创建 public 子模块
```sh
$ git submodule add -f git@github.com:gknoone/gknoone.github.io.git public
```

## 生成最终发布的网站内容
```sh
$ hugo
```

## 推送到远程<username>.github.io
```sh
$ cd public
$ git status
$ git add .
$ git commit -m "first commit"
$ git push -u orgin master
```

## 推送到远程blog

```sh
$ cd ..
$ vim .gitignore
```

添加如下内容

```.gitignore
# Created by .ignore support plugin (hsz.mobi)
### macOS template
# General
.DS_Store
.AppleDouble
.LSOverride

# Icon must end with two \r
Icon

# Thumbnails
._*

# Files that might appear in the root of a volume
.DocumentRevisions-V100
.fseventsd
.Spotlight-V100
.TemporaryItems
.Trashes
.VolumeIcon.icns
.com.apple.timemachine.donotpresent

# Directories potentially created on remote AFP share
.AppleDB
.AppleDesktop
Network Trash Folder
Temporary Items
.apdisk

### Hugo template
# Generated files by hugo
/public/
/resources/_gen/

# Executable may be added to repository
hugo.exe
hugo.darwin
hugo.linux
```

## 自动部署脚本

将以上步骤添加到自动执行脚本中 deploy.sh，脚本 commit 提交信息会使用执行时的时间，将脚本放到网站项目路径下，写完博客后，双击运行即可自动部署发布

```sh
#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..
```

## 支持评论

Hugo 支持 Disqus 评论，只需要在配置文件 config.toml 中设置 disqusShortname = "disqusShortname"，如果没有 disqusShortname，需要到 [Disqus 官网](https://disqus.com/)注册一个账号，注册后添加一个网站，添加时会让填一个 shortname，Disqus 会生成一个 shortname.disqus.com 的网址，另外还需要把 config.toml 中的 baseURL 地址，也就是公网访问地址添加到 Diqus 的信任网址中，类似于互相添加信任