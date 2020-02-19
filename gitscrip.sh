#!/bin/bash

echo -e "\033[0;32m📤开始推送hugo主文件到远程blog-repo\033[0m"

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Pull source 
git pull origin master

# Push source and build repos.
git push origin master

