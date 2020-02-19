---
title: "Git使用子模块功能搭建多模块无关联IDEA项目"
date: 2020-02-19T09:00:55+08:00
draft: false
keywords: ["git","submodule","idea"]
tags: ["git","submodule","idea"]
categories: ["Git","IDEA"]
---

## 项目创建

```sh
$ mkdir project-parent
$ cd project-parent
$ git submodule add git@repo1
$ git submodule add git@repo2
$ git submodule add git@repo3
## git push
```

## 加载项目（他人）

```sh
$ git clone git@project-parent-repo
$ cd project-parent
$ git submodule init
$ git submodule update
```

## idea

1. idea使用open打开项目
![](https://cdn.jsdelivr.net/gh/gknoone/pic-cloud/img/20200218154952.png)
2. 配置
   - 设置jdk
   ![](https://cdn.jsdelivr.net/gh/gknoone/pic-cloud/img/20200218153613.png)
   - 导入子模块
   ![](https://cdn.jsdelivr.net/gh/gknoone/pic-cloud/img/20200218153759.png)
3. 更新maven

## 子模块的更新

子模块的维护者提交了更新后，使用子模块的项目必须手动更新才能包含最新的提交。
   
在项目中，进入到子模块目录下，执行 git pull 更新，查看 git log 查看相应提交。
   
完成后返回到项目目录，可以看到子模块有待提交的更新，使用 git add，提交即可。
   
## 删除子模块
有时子模块的项目维护地址发生了变化，或者需要替换子模块，就需要删除原有的子模块。

删除子模块较复杂，步骤如下：

`rm -rf` 子模块目录 删除子模块目录及源码
`vi .gitmodules` 删除项目目录下.gitmodules 文件中子模块相关条目
`vi .git/config` 删除配置项中子模块相关条目
`rm .git/module/*` 删除模块下的子模块目录，每个子模块对应一个目录，注意只删除对应的子模块目录即可
执行完成后，再执行添加子模块命令即可，如果仍然报错，执行如下：

`git rm --cached` 子模块名称

完成删除后，提交到仓库即可。


