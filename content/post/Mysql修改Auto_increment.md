---
title: "Mysql修改Auto_increment"
date: 2020-02-26T10:25:52+08:00
draft: false
keywords: [ "Mysql", "Auto_increment","主键自增" ]
tags: ["mysql","auto_increment"]
categories: ["Mysql"]
---

## 查看 

```sql
select auto_increment from information_schema.tables where table_schema='xxx_db' and table_name='xxx'; 
```

## 修改

```sql
alter table xxx_db.xxx auto_increment=1000;
```

> 坑：假设表中有ID大于你设置的值如1000，修改将不会生效

