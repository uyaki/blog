---
title: "SpringBoot设置项目热启动"
date: 2020-02-23T00:04:23+08:00
draft: false
keywords: [ "", "" ]
tags: [""]
categories: [""]
---
## 导入jar包
```
'org.springframework.boot:spring-boot-devtools'
```
## 添加配置项
```yaml
devtools: #热部署
    restart:
      enabled: true
```

## 在idea开启
1. 如下图设置 `Build，Execution...->Compiler`，勾选 `Build project automatically`
![](https://cdn.jsdelivr.net/gh/uyaba/pic-cloud/img/20200223011604.png)
2. 快捷键 `commond+option+shift+'/'`，弹出`Maintenance`界面
![](https://cdn.jsdelivr.net/gh/uyaba/pic-cloud/img/20200223011708.png)
3. 点击`Registry`, 勾选compiler.automake.allow.when.app.running
![](https://cdn.jsdelivr.net/gh/uyaba/pic-cloud/img/20200223011808.png)
4. 重启项目

