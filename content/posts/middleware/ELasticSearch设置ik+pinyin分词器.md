---
title: "ELasticSearch设置ik+pinyin分词器"
subtitle: 
date: 2020-03-05T19:28:53+08:00
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
## 安装

> 假设你已经使用docker安装了es集群
```bash
$ cd ${docker-compose-file-dir}
```

1. 安装ik插件
```bash
$ docker-compose exec es01 elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.6.0/elasticsearch-analysis-ik-7.6.0.zip
```
2. 安装pinyin插件
```bash
$ docker-compose exec es01 elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-pinyin/releases/download/v7.6.0/elasticsearch-analysis-pinyin-7.6.0.zip
```
3. 重启docker
```bash
$ docker-compose restart
```

## 使用

### 创建索引

```http
PUT /my_index
{
    "settings": {
        "index": {
            "number_of_shards": "1",
            "analysis": {
                "analyzer": {
                    "default": {
                        "tokenizer": "ik_max_word"
                    },
                    "pinyin_analyzer": {
                        "type": "custom",
                        "tokenizer": "my_pinyin",
                        "filter": [
                            "word_delimiter"
                        ]
                    }
                },
                "tokenizer": {
                    "my_pinyin": {
                        "type": "pinyin",
                        "keep_first_letter": true,
                        "keep_separate_first_letter": false,
                        "keep_full_pinyin": true,
                        "keep_original": false,
                        "limit_first_letter_length": 16,
                        "lowercase": true
                    }
                },
                "number_of_replicas": "1"
            }
        }
    },
    "mappings": {
        "properties": {
            "id": {
                "type": "keyword",
                "fields": {
                    "keyword": {
                        "type": "keyword",
                        "ignore_above": 256
                    }
                }
            },
            "name": {
                "type": "text",
                "analyzer": "ik_max_word",
                "copy_to": true,
                "fields": {
                    "pinyin": {
                        "type": "text",
                        "term_vector": "with_positions_offsets",
                        "analyzer": "pinyin_analyzer",
                        "boost": 10
                    },
                    "keyword": {
                        "type": "keyword",
                        "ignore_above": 256
                    }
                }
            }
        }
    }
}
```

### 检查自定义的词语分析器是否生效

```http
## 请求
POST /my_index/_analyze
{
  "text":"sao的一逼",
  "analyzer":"pinyin_analyzer"
}
## 结果
{
  "tokens" : [
    {
      "token" : "sao",
      "start_offset" : 0,
      "end_offset" : 0,
      "type" : "word",
      "position" : 0
    },
    {
      "token" : "saodyb",
      "start_offset" : 0,
      "end_offset" : 0,
      "type" : "word",
      "position" : 0
    },
    {
      "token" : "de",
      "start_offset" : 0,
      "end_offset" : 0,
      "type" : "word",
      "position" : 1
    },
    {
      "token" : "yi",
      "start_offset" : 0,
      "end_offset" : 0,
      "type" : "word",
      "position" : 2
    },
    {
      "token" : "bi",
      "start_offset" : 0,
      "end_offset" : 0,
      "type" : "word",
      "position" : 3
    }
  ]
}
```

### 新增数据
> 可以使用[datax](https://github.com/alibaba/DataX)批量导入数据，后面再开一坑
```markdown
略
```

### 按「拼音」搜索

```http
POST /my_index/_search
{
    "query":{
      "match":{
        "name.pinyin":"liudehua"
      }
    }
}
```

### 按「中文名」搜索

```http
POST /my_index/_search
{
    "query":{
      "match":{
        "name":"靖哥哥"
      }
    }
}
```

### 按「中文名 + 拼音」搜索

```http
POST /my_index/_search
{
	"query": {
    "multi_match": {
      "type":"most_fields",
      "query":"jing",
      "fields":["name", "name.pinyin"]
    }
  }
}
```

### 分析执行结果

```http
GET my_index/_validate/query?explain
{
  "query": {
    "multi_match": {
      "type":"most_fields",
      "query":"靖g哥",
      "fields":["name", "name.pinyin"]
    }
  }
}
## 结果
{
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "failed" : 0
  },
  "valid" : true,
  "explanations" : [
    {
      "index" : "my_index",
      "valid" : true,
      "explanation" : "((Synonym(name.pinyin:jgg name.pinyin:jing) (name.pinyin:g)^10.0 (name.pinyin:ge)^10.0) | (name:靖 name:g name:哥))~1.0"
    }
  ]
}
```