---
title: "Git标准Fork & Pull Request流程"
date: 2020-02-23T22:53:46+08:00
draft: false
keywords: [ "git", "fork","Pull Request" ]
tags: ["git"]
categories: ["Git"]
---
## fork项目

直接进入 GitHub 页面，点击`Fork`按钮。 就是这么简单。

克隆到本地，才能开始骚操作～～

```sh
# Clone your fork to your local machine
$ git clone git@github.com:USERNAME/FORKED-PROJECT.git
```

## 让你的fork保持最新

```sh
# Add 'upstream' repo to list of remotes
$ git remote add upstream https://github.com/UPSTREAM-USER/ORIGINAL-PROJECT.git

# Verify the new remote named 'upstream'
$ git remote -v
```

获取上游 repo 的分支和最新的提交来将它们放入你的存储库

```sh
# Fetch from upstream remote
$ git fetch upstream

# View all branches, including those from upstream
$ git branch -va
```

检查你自己的 master 分支、合并上游的 master 分支

```sh
# Checkout your master branch and merge upstream
git checkout master
git merge upstream/master
```
现在，您的本地主分支是最新的一切修改上游。

> 如果在本地 master 分支上没有唯一的提交，git 将简单地执行快进操作。 然而，如果您一直在 master 上进行更改(在绝大多数情况下，您可能不应该这样做——请参阅下一部分，您可能必须处理冲突。 在这样做的时候，要注意尊重上游所做的更改。

## 开发

无论何时开始处理一个新特性或修复错误，创建一个新分支都是很重要的。 它不仅是正确的 git 工作流，而且还可以使您的更改与主分支保持组织和分离，这样您就可以轻松地为您完成的每个任务提交和管理多个拉请求。

```sh
# Checkout the master branch - you want your new branch to come from master
$ git checkout master

# Create a new branch named newfeature (give your branch its own simple informative name),Switch to your new branch
$ git branch -b newfeature
```

> 开始折腾吧

## 提交一个Pull Request

### 清理你的工作

在提交您的拉请求之前，您可能需要做一些事情来清理您的分支，并使其尽可能简单，以便原来的 repo 的维护人员测试、接受和合并您的工作。

如果已经向上游主分支提交了任何提交，那么您应该重新设置开发分支的基础，以便合并它将是一个简单的快进操作，不需要任何冲突解决工作。

```sh
# Fetch upstream master and merge with your repo's master branch
$ git fetch upstream
$ git checkout master
$ git merge upstream/master

# If there were any new commits, rebase your development branch
$ git checkout newfeature
$ git rebase master
```
现在，可能需要将一些较小的提交压缩成较大的、更具凝聚力的提交。 你可以通过一个交互式 rebase 来实现:

```sh
# Rebase all commits on your development branch
$ git checkout 
$ git rebase -i master
```

这将打开一个文本编辑器，您可以在其中指定哪些提交要压制。

### 提交

一旦你把所有的修改都提交到 GitHub，在 GitHub 上进入你的 fork 页面，选择你的开发分支，然后点击 pull request 按钮。 如果你需要对你的 pull 请求做任何调整，只需将更新推送到 GitHub 即可。 您的拉请求将自动跟踪开发分支上的更改并进行更新。

## 接受和合并拉请求

请注意，前面的部分是从创建 fork 并生成 pull 请求的人的角度编写的，而本节是从处理传入 pull 请求的原始存储库所有者的角度编写的。 因此，当“ forker”将原始存储库称为上游存储库时，我们现在将其视为原始存储库的所有者和标准的远程起源。

### 检查和测试拉请求

打开。 `.git/config` 文件，并在`[ remote "origin"]`下添加一个新行:

```sh
fetch = +refs/pull/*/head:refs/pull/origin/*
```
现在，您可以获取和检出任何拉请求，以便您可以测试它们:

```sh
# Fetch all pull request branches
$ git fetch origin

# Checkout out a given pull request branch based on its number
$ git checkout -b 999 pull/origin/999
```
请记住，这些分支是只读的，您不能推送任何更改。

### 自动合并拉请求

如果合并是一个简单的`fast-forward`，你可以通过点击 GitHub 上的 pull request 页面上的按钮来自动完成合并。

### 手动合并拉请求

要手动执行合并，您需要在源代码报告中签出目标分支，直接从分支中拉出，然后合并并推出。

```sh
# Checkout the branch you're merging to in the target repo
$ git checkout master

# Pull the development branch from the fork repo where the pull request development was done.
$ git pull https://github.com/forkuser/forkedrepo.git newfeature

# Merge the development branch
$ git merge newfeature

# Push master with the new feature merged into it
$ git push origin master
```

现在您已经完成了开发分支，可以自由地删除它了。

```sh
$ git branch -d newfeature
```

## 巨人的肩膀

[https://gist.github.com/Chaser324/ce0505fbed06b947d962](https://gist.github.com/Chaser324/ce0505fbed06b947d962)


