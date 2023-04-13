---
title: Hugo使用admonition美化文章
subtitle:
date: 2023-04-14T05:06:17+08:00
author:
  name: uyaki
  link: https://www.github.com/uyaki
  avatar: /images/avatar.png
description: 
keywords: "shorcode"
comment: true
weight: 0
tags:
  - blog
categories:
  - blog
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

hugo的LoveIt，FixIt主题都集成了admonition shorcode功能，可以比较方便的进行使用，语法和样式效果如下。

## 注意

```markdown
{{</* admonition note */>}}
一个 **注意** 横幅
{{</* /admonition */>}}
```

{{< admonition note>}}
一个 **注意** 横幅
{{< /admonition >}}

## 技巧

```markdown
{{</* admonition tip */>}}
一个 **技巧** 横幅
{{</* /admonition */>}}
```

{{< admonition tip>}}
一个 **提示** 横幅
{{< /admonition >}}

## 摘要

```markdown
{{</* admonition abstract */>}}
一个 **摘要** 横幅
{{</* /admonition */>}}
```

{{< admonition abstract>}}
一个 **摘要** 横幅
{{< /admonition >}}

## 信息

```markdown
{{</* admonition info */>}}
一个 **信息** 横幅
{{</* /admonition */>}}
```

{{< admonition info>}}
一个 **信息** 横幅
{{< /admonition >}}

## 成功

```markdown
{{</* admonition success */>}}
一个 **成功** 横幅
{{</* /admonition */>}}
```

{{< admonition success>}}
一个 **成功** 横幅
{{< /admonition >}}

## 问题 

```markdown
{{</* admonition question */>}}
一个 **问题** 横幅
{{</* /admonition */>}}
```

{{< admonition question>}}
一个 **问题** 横幅
{{< /admonition >}}

## 警告

```markdown
{{</* admonition warning */>}}
一个 **警告** 横幅
{{</* /admonition */>}}
```

{{< admonition warning>}}
一个 **警告** 横幅
{{< /admonition >}}

## 失败

```markdown
{{</* admonition failure */>}}
一个 **失败** 横幅
{{</* /admonition */>}}
```

{{< admonition failure>}}
一个 **失败** 横幅
{{< /admonition >}}

## 危险

```markdown
{{</* admonition danger */>}}
一个 **危险** 横幅
{{</* /admonition */>}}
```

{{< admonition danger>}}
一个 **危险** 横幅
{{< /admonition >}}

## bug

```markdown
{{</* admonition bug */>}}
一个 **bug** 横幅
{{</* /admonition */>}}
```

{{< admonition bug>}}
一个 **bug** 横幅
{{< /admonition >}}

## 示例

```markdown
{{</* admonition example */>}}
一个 **示例** 横幅
{{</* /admonition */>}}
```

{{< admonition example>}}
一个 **示例** 横幅
{{< /admonition >}}

## 引用

```markdown
{{</* admonition quote */>}}
一个 **引用** 横幅
{{</* /admonition */>}}
```

{{< admonition quote>}}
一个 **引用** 横幅
{{< /admonition >}}