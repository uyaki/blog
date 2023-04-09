---
title: "Window新机dotfile"
subtitle: 
date: 2023-02-09T17:36:46+08:00
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
  - dotfiles 
categories:
  - dotfiles
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
# windows 安装说明

- [windows 安装说明](#windows-安装说明)
  - [winget 安装](#winget-安装)
  - [chocolatey 安装](#chocolatey-安装)
  - [安裝wsl](#安裝wsl)
    - [步骤1 打开windows的wsl功能。](#步骤1-打开windows的wsl功能)
    - [步骤2 启用虚拟机功能](#步骤2-启用虚拟机功能)
    - [步骤3 下载 Linux 内核更新包](#步骤3-下载-linux-内核更新包)
    - [步骤4 选择并安装linux](#步骤4-选择并安装linux)
    - [步骤5 登录退出](#步骤5-登录退出)
  - [OpenSSL](#openssl)
  - [windows Terminal](#windows-terminal)
    - [下载字体Meslo](#下载字体meslo)

--- 

## winget 安装

请到 [winget官方](https://github.com/microsoft/winget-cli/releases) 查看最新可下载版本

```sh
## 下载
$ curl.exe -L -o $HOME/Downloads/winget.msixbundle https://github.com/microsoft/winget-cli/releases/download/v1.2.10271/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle

## 安装winget
$ msiexec winget.msixbundle

## 查看版本
$ winget -v
```

---

## chocolatey 安装

> chocolatey [官网](https://chocolatey.org/install#individual)

管理员身份运行powershell

```sh
$ Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

---

## 安裝wsl

### 步骤1 打开windows的wsl功能。

- 方式一：使用命令行（推荐）
  
以管理员身份打开 PowerShell（`“开始”菜单` -> `PowerShell` -> `单击右键` -> `以管理员身份运行`）并运行：
```sh
$ dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

- 方式二：使用图形界面

具体操作路径：`控制面板` -> `所有控制面板项` -> `程序和功能` -> `启用或关闭Windows功能` -> 勾选✔️`适用于Linux的Windows子系统。`

![](img/wsl.png)

### 步骤2 启用虚拟机功能

安装 WSL 2 之前，必须启用“虚拟机平台”可选功能。 

计算机需要虚拟化功能才能使用此功能。

以管理员身份打开 PowerShell 并运行：

```sh
$ dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

**重新启动计算机**，以完成 WSL 安装并更新到 WSL 2。

### 步骤3 下载 Linux 内核更新包

> 步骤2后**重新启动计算机**后才可以设置wsl2

- 下载
  
```sh
## 使用PowerShell的WebClient下载
$ $client = new-object System.Net.WebClient
$ $client.DownloadFile('https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi',$HOME+'\Downloads\wsl_update_x64.msi')

## curl下载
$ curl.exe -L -o $HOME/Downloads/wsl_update_x64.msi https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
```

- 安装
```sh
## 进入下载目录
$ cd $HOME\Downloads
## 安装
$ msiexec /package wsl_update_x64.msi
## 设置默认版本
$ wsl --set-default-version 2
```

### 步骤4 选择并安装linux

> [wsl官方文档](https://docs.microsoft.com/zh-cn/windows/wsl/install)

```sh
# 查看可安装版本 wsl --list --online
$ wsl -l -o

# 安装 ubuntu
## 下载完成之后，会要求配置初始的用户名和密码。
$ wsl --install -d  Ubuntu

# 升级成 wsl2
## WSL 2 是适用于 Linux 的 Windows 子系统体系结构的一个新版本，它支持适用于 Linux 的 Windows 子系统在 Windows 上运行 ELF64 Linux 二进制文件。 它的主要目标是提高文件系统性能，以及添加完全的系统调用兼容性
## 可以使用 wsl -l -v 查看是否需要更换wsl2 这可能是因为你在升级wsl2之前就已经安装了子系统
$ wsl --set-version Ubuntu 2
```
![wsl-l-v](./img/wsl-l-v.png)

### 步骤5 登录退出

```sh
$ wsl
```

![wsl-lo](./img/wsl-lo.png)

之后的操作见 [ubuntu-install.md](../linux/ubuntu-install.md)

---

## OpenSSL

TODO

---

## windows Terminal

### 下载字体Meslo

[字体字体安装教程](./../font/font.md)