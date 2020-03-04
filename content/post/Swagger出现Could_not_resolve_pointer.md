---
title: "Swagger出现Could not resolve pointer"
date: 2020-03-04T11:29:31+08:00
draft: false
keywords: [ "Swagger", "bug" ]
tags: ["swagger"]
categories: ["java","swagger"]
---

## 问题描述

![](https://cdn.jsdelivr.net/gh/gknoone/pic-cloud/img/20200304113107.png)

## 原因

类上的注解 “/” 的问题

@ApiModel(不能使用“/”)

