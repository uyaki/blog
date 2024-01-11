---
title: Tmux
subtitle:
date: 2024-01-07T16:05:56+08:00
author:
  name: uyaki
  link: https://www.github.com/uyaki
  avatar: /images/avatar.png
description:
keywords:
  -
comment: true
weight: 0
tags:
  - tmux
  - command_line_tools
categories:
  - command_line_tools
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

## Tmux 重要概念

使用 Tmux 的时候千万不要去背指令，所有的指令都可以在 .tmux.conf 配置文件中绑定自己顺手的快捷键，也可以配置开启鼠标。

在Tmux逻辑中，需要分清楚`Server > Session > Window > Pane`这个大小和层级顺序是极其重要的，直接关系到工作效率：

- Server：是整个tmux的后台服务。有时候更改配置不生效，就要使用tmux kill-server来重启tmux。
- Session 会话：是tmux的所有会话。我之前就错把这个session当成窗口用，造成了很多不便里。一般只要保存一个session就足够了。
- Window 窗口：相当于一个工作区，包含很多分屏，可以针对每种任务分一个Window。如下载一个Window，编程一个window。
- Pane 面板：是在Window里面的小分屏。最常用也最好用

了解了这个逻辑后，整个Tmux的使用和配置也就清晰了。

{{< admonition tip >}}
我将自己的配置信息统一设置在了 `$XDG_CONFIG_HOME` 下，

所以，我的配置文件为 `~/.config/tmux/tmux.conf`
{{< /admonition >}}

## 安装

```bash
## macOS
brew install tmux
## ubuntu
sudo apt-get install tmux
```

## Tmux 常用命令

|命令|功能|
|---|---|
|`tmux [new -s 会话名 -n 窗口名]`|启动新session|
|`tmux at [-t 会话名]`|恢复session|
|`tmux ls`|列出所有sessions|
|`tmux kill-session -t 会话名`|关闭session|
|`tmux kill-server`|关闭整个tmux服务器|

## Tmux 常用内部命令

所谓内部命令，就是进入Tmux后，并按下前缀键后的命令，一般前缀键为Ctrl+b.

### Session相关

|前缀+命令|功能|
|:---:|---|
|`?`|显示快捷键帮助文档|
|`d`|断开当前会话|
|`D`|选择要断开的会话|
|`Ctrl+z`|挂起当前会话|
|`r`|强制重载当前会话|
|`s`|显示会话列表用于选择并切换|
|`:`|进入命令行模式，此时可直接输入ls等命令|
|`[`|进入复制模式，按q退出|
|`]`|粘贴复制模式中复制的文本|
|`~`|列出提示信息缓存|

### Window相关

|前缀+命令|功能|
|:---:|---|
|`c`|新建窗口|
|`&`|关闭当前窗口|
|`0 ~ 9`|切换到指定窗口|
|`p`|切换到上一窗口|
|`n`|切换到下一窗口|
|`w`|打开窗口列表，用于且切换窗口|
|`,`|重命名当前窗口|
|`.`|修改当前窗口编号（适用于窗口重新排序）|
|`f`|快速定位到窗口（输入关键字匹配窗口名称）|

### Pane相关

|前缀+命令|功能|
|:---:|---|
|`"`|当前面板上下一分为二，下侧新建面板|
|`%`|当前面板左右一分为二，右侧新建面板|
|`x`|关闭当前面板（关闭前需输入y or n确认）|
|`z`|最大化当前面板，再重复一次按键后恢复正常（v1.8版本新增）|
|`!`|将当前面板移动到新的窗口打开（原窗口中存在两个及以上面板有效）|
|`;`|切换到最后一次使用的面板|
|`q`|显示面板编号，在编号消失前输入对应的数字可切换到相应的面板|
|`{`|向前置换当前面板|
|`}`|向后置换当前面板|
|`Ctrl+o`|顺时针旋转当前窗口中的所有面板|
|`方向键`|移动光标切换面板|
|`o`|选择下一面板|
|`空格键`|在自带的面板布局中循环切换|
|`Alt+方向键`|以5个单元格为单位调整当前面板边缘|
|`Ctrl+方向键`|以1个单元格为单位调整当前面板边缘（Mac下）|
|`t`|显示时钟|

## 配置文件

位置：`~/.config/tmux/tmux.conf`

### 激活

```bash
git clone git@github.com:uyaki/config.git
cp config/tmux/tmux.conf ~/.config/tmux/tmux.conf
```

有3种激活方式：

- 重新加载：`tmux source ~/.config/tmux/tmux.conf`
- 在 tmux 窗口中，先按下 `Ctrl+b` 指令前缀，然后按下系统指令`:`，进入到命令模式后输入 `source-file ~/.config/tmux/tmux.conf`，回车后生效
- 重启 tmux：`restart tm

## 插件

### 插件管理器

Github地址：[tpm](https://github.com/tmux-plugins/tpm)

安装：

1. 克隆

```
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

2. 修改配置文件

修改配置文件`~/.config/tmux/tmux.conf`

```tmux
setenv -g TMUX_PLUGIN_MANAGER_PATH '~/.config/tmux/plugins'

# List of plugins
set -g @plugin 'tmux-plugins/tpm' # 使用插件管理器
# 推荐的插件（请去每个插件的仓库下读一读使用教程）
set -g @plugin 'seebi/tmux-colors-solarized'

# 初始化 TPM 插件管理器 (放在配置文件的最后)
run '~/.config/tmux/plugins/tpm/tpm'
```

3. 重新加载 TMUX 环境，以便获取 TPM：

```bash
tmux source ~/.config/tmux/tmux.conf
```

|编号|快捷键|对应功能说明|
|:---:|:---|---|
|1|`prefix + I`|安装配置文件中列出的插件(`~/.config/tmux/tmux.conf`)|
|2|`prefix + U`|卸载配置文件中列出的插件(`~/.config/tmux/tmux.conf`)|
|3|`prefix + alt + u`|移除并删除在配置文件没有列出的插件|

### tmux-powerline

官方：[erikw/tmux-powerline](https://github.com/erikw/tmux-powerline)

在配置文件`~/.config/tmux/tmux.conf`中，添加

```fish
set -g @plugin 'erikw/tmux-powerline'
```

执行：`<prefox + I`>

生成配置文件

```bash
~/.config/tmux/plugins/tmux-powerline/generate_rc.sh
```

复制生成的配置文件

```bash
mv ~/.config/tmux-powerline/config.sh.default ~/.config/tmux-powerline/config.sh
```

编辑它！