---
title: "MacOS使用MacVim替代vim"
date: 2020-02-11T11:06:59+08:00
draft: false
keywords: ["macOS","vim","macvim"]
tags: ["macOS","vim","软件"]
categories: ["macOS","vim","软件"]
toc: false
---

```bash
## 安装macvim
brew install macvim

## 编辑配置文件
vim ~/.zshrc

## 添加
alias vi=vim
alias vim=mvim
alias mvim='/usr/local/bin/mvim -v'

## 生效
source ~/.zshrc
```
