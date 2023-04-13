---
title: "Mysql修改Auto_increment"
subtitle: 
date: 2020-02-26T10:25:52+08:00
draft: false
author:
  name: uyaki
  link: https://www.github.com/uyaki
  avatar: /images/avatar.png
description:
keywords: 
license:
comment: true
weight: 0
tags:
  - java 
categories:
  - java
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
## 查看 

```sql
select auto_increment from information_schema.tables where table_schema='xxx_db' and table_name='xxx'; 
```

## 修改

```sql
alter table xxx_db.xxx auto_increment=1000;
```

> 坑：假设表中有ID大于你设置的值如1000，修改将不会生效

