---
title: "Git中HEAD游离的原因与解决方法"
date: 2020-02-17T14:48:59+08:00
draft: false
keywords: ["git","HEAD","游离"]
tags: ["git"]
categories: ["git"]
---

## 什么是 HEAD

Git 中的 HEAD 可以理解为指针，指向当前仓库所处的分支。一般在有 Git 管理的目录下打开 Git 终端都能在当前路径的尾巴上，看到所处的分支名。

还可以在命令行中输入 `cat .git/HEAD` 查看当前 HEAD 指向哪里。

![](https://cdn.jsdelivr.net/gh/uyaba/pic-cloud/img/20200217145433.png)

一般它指向当前工作目录所在分支的最新提交

![](https://cdn.jsdelivr.net/gh/uyaba/pic-cloud/img/20200217145602.png)

## 如何造成 HEAD 的游离状态

一般我们会使用命令 `git checkout ` 来切换分支，HEAD 就会移动到指定的分支上

![](https://cdn.jsdelivr.net/gh/uyaba/pic-cloud/img/20200217145701.png)

但是，如果我们使用的是 `git checkout ` 来切换到指定的某一次提交，HEAD 就会处于「detached」状态，也就是**游离状态**

![](https://cdn.jsdelivr.net/gh/uyaba/pic-cloud/img/20200217145740.png)

## HEAD 游离状态的利弊

> 好处：HEAD 处于游离状态时，开发者可以很方便地在历史版本之间互相切换，比如要回到某次提交，只需要 `checkout` 对应的 `commit id` 或者 `tag` 名即可。

> 弊端：若在该基础上进行了提交，则会新开一个「匿名分支」；也就是说我们的提交是**无法可见保存**的，一旦切换到别的分支，原游离状态以后的提交就**不可追溯**了。


![](https://cdn.jsdelivr.net/gh/uyaba/pic-cloud/img/20200217145833.png)

## 如何解决

在切换到游离状态的时候应该新建一个分支，然后我们所有的操作修改和提交都会保存到该分支，HEAD 也就指向了该分支最新提交的 commit id 处，而不会再处于游离状态。

1. 查看当前领先多少

   ```bash
   $ git branch -v
   ```

2. 新建分支保存，2选1，根据实际情况

   ```bash
   ## 方式一： 当前所有复制到新的分支
   $ git branch -b callback
   ## 方式二：用commit_id去新建分支，达到控制版本的目的，commit_id为你提交时拿到的id，通过分支名去操作id
   $ git branch callback commit_id
   ```

3. 切换回工作分支（假设当前分支为dev），并合刚刚新建的分支

   ```bash
   # 回到工作分支
   $ git checkout dev
   # 合并刚刚新建的分支
   $ git merge callback  
   # 查看下合并结果，有冲突就解决
   $ git status 
   # 好习惯
   $ git pull 
   # 没有问题可以push
   $ git push
   ```

4. 删除分支

   ```bash
   $ git branch -d callback 
   ```
