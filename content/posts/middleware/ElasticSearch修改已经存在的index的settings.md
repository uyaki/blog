---
title: "ElasticSearch修改已经存在的index的settings"
subtitle: 
date: 2020-03-05T16:44:08+08:00
draft: false
author:
  name: uyaki
  link: https://www.github.com/uyaki
  avatar: /images/avatar.png
description:
keywords: 
license:
comment: false
weight: 0
tags:
  - 中间件 
categories:
  - 中间件
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
1. 关闭索引
```elasticsearch
POST /index/_close
```

2. 修改索引Settings
```elasticsearch
PUT /index/_settings
{
    "settings": {
        "analysis": {
            "analyzer": {
                "ik_pinyin_analyzer": {
                    "type": "custom",
                    "tokenizer": "ik_smart",
                    "filter": [
                        "my_pinyin",
                        "word_delimiter"
                    ]
                }
            },
            "filter": {
                "my_pinyin": {
                    "type": "pinyin",
                    "keep_first_letter": false,
                    "keep_full_pinyin": true,
                    "keep_none_chinese": true,
                    "keep_none_chinese_in_first_letter": true,
                    "keep_original": false,
                    "limit_first_letter_length": 16,
                    "lowercase": true,
                    "trim_whitespace": true
                }
            }
        }
    }
}
```

3. 打开索引
```elasticsearch
POST /index/_open
```
