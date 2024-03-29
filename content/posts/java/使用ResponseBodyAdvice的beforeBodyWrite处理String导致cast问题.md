---
title: "使用ResponseBodyAdvice的beforeBodyWrite处理String导致cast问题"
subtitle: 
date: 2020-02-17T15:02:02+08:00
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
  - java 
categories:
  - java
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
## 问题

配置全局返回时

```java
@Configuration
public class GlobalReturnConfig {
    @RestControllerAdvice(basePackages = "com.benyuan")
    static class ResultResponseAdvice implements ResponseBodyAdvice<Object> {
        @Override
        public boolean supports(MethodParameter methodParameter, Class<? extends HttpMessageConverter<?>> aClass) {
            return true;
        }

        @Override
        public Object beforeBodyWrite(Object body, MethodParameter methodParameter, MediaType mediaType, Class<? extends HttpMessageConverter<?>> aClass, ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse) {
            if (body instanceof ResponseDTO) {
                return body;
            }
            return ResponseDTOUtil.success(body);
        }
    }

}
```

beforeBodyWrite方法在处理String类型返回值的时候，会造成ResponseDTO can not be cast to String的BUG

## 解决

```java
/**
 * 使用RestControllerAdvice的beforeBodyWrite方法时，在处理String时，实际处理的HttpMessageConverter，应该是MappingJackson2HttpMessageConverter
 * @Description
 */
@Configuration
public class WebConfiguration implements WebMvcConfigurer {
    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        // 0-1可配，2-8是默认加载的
        converters.add(0, new MappingJackson2HttpMessageConverter());
    }
}
```
