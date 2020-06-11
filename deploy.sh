#!/bin/bash

echo -e "\033[0;32m😝开始发布博客啦！！！😝\033[0m"

# Build the project.
echo -e "\033[0;32m📥开始生成hugo站点静态文件\033[0m"
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`
echo -e "\033[0;32m📤开始推送hugo站点静态文件到Github\033[0m"
# Go To Public folder
cd public
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
baiduSEO=true
while $baiduSEO
do
	  read -r -p "❓是否需要推送到百度SEO[Y/n] " input

	  case $input in
	      [yY][eE][sS]|[yY])
			      ## 生成sitemap.txt
            echo -e "\033[0;32m🌏开始生成sitemap.txt文件\033[0m"
            python sitemap-xml2txt.py
            ## 推送到百度
            echo -e "\033[0;32m💣开始推送sitemap文件到百度SEO\033[0m"
            curl -H 'Content-Type:text/plain' --data-binary @sitemap.txt "http://data.zz.baidu.com/urls?site=https://uyaba.github.io&token=augsNyfDJdgYTaAE"
            baiduSEO=false
            ;;

	      [nN][oO]|[nN])
			      echo -e "\033[0;32m跳过百度SEO推送～～\033[0m"
            baiduSEO=false
			      ;;

	      *)
			      echo "❌无效的输入..."
			      ;;
	  esac
done

# Come Back up to the Project Root
cd ..
echo -e "\n\033[0;32m👀很骚的操作～～～\033[0m"
blogPush=true
while $blogPush
do
	  read -r -p "❓是否需要推送hugo主文件到远程blog-repo[Y/n] " input

	  case $input in
	      [yY][eE][sS]|[yY])
			      ./gitscrip.sh
            blogPush=false
            ;;

	      [nN][oO]|[nN])
			      echo -e "\033[0;32m跳过blog-repo 推送～～\033[0m"
            blogPush=false
			      ;;

	      *)
			      echo "❌无效的输入..."
			      ;;
	  esac
done



## 退出友好提示
echo -e "\n\033[0;32m🏆博客发布成功啦～～～🏆\033[0m"
