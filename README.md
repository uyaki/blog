# README

## HomePage

[uyaki's HomePage](https://uyaki.github.io/)

## Usage
```bash
## clone project
$ git clone git@github.com:uyaki/blog.git
## update theme
$ cd blog
$ git submodule init 
$ git submodule update

## pull public
$ cd public
$ git pull
$ cd ..

## 安装hugo-algolia
$ npm install hugo-algolia -g
```

## Update

### Add A New Content

```bash
## add new 
$ hugo new post/[modules]/[title].md
## build hugo
$ hugo
## local test
$ hugo server -D
## 127.0.0.1:1313
```

### Push

```bash
## push public
cd public 
git add .
git commit -m ""
git push
## push blog
cd ..
git add .
git commit -m ""
git push

## update algolia search
hugo-algolia -s
```
