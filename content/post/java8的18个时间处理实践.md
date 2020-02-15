---
title: "Java8的18个时间处理实践"
date: 2020-02-15T15:58:54+08:00
draft: false
tags: ["java8","时间处理"]
categories: ["JAVA"]
---

## java8 关于时间、日期处理

Java 8 推出了全新的日期时间 API。

Java 处理日期、日历和时间的方式一直为社区所诟病，将 java.util.Date 设定为可变类型，以及 SimpleDateFormat 的非线程安全使其应用非常受限。

新 API 基于 ISO 标准日历系统，java.time 包下的所有类都是**不可变类型而且线程安全**。


| 编号 | 类的名称                           | 描述                                      |
| ---  | :---                               | :---                                      |
|    1 | Instant                            | 时间戳                                    |
|    2 | Duration                           | 持续时间，时间差                          |
|    3 | LocalDate                          | 只包含日期，比如：2018-02-05              |
|    4 | LocalTime                          | 只包含时间，比如：23:12:10                |
|    5 | LocalDateTime                      | 包含日期和时间，比如：2018-02-05 23:14:21 |
|    6 | Period                             | 时间段                                    |
|    7 | ZoneOffset                         | 时区偏移量，比如：+8:00                   |
|    8 | ZonedDateTime                      | 带时区的时间                              |
|    9 | Clock                              | 时钟，比如获取目前美国纽约的时间          |
|   10 | java.time.format.DateTimeFormatter | 时间格式化                                |

## LocalDate

### 1.获取今天的日期 

Java 8 中的 LocalDate 用于表示当天日期。和 java.util.Date 不同，它只有日期，不包含时间。当你仅需要表示日期时就用这个类。

```java
LocalDate today = LocalDate.now();
System.out.println("今天的日期:"+today);
```

### 2.获取年、月、日信息

```java
LocalDate today = LocalDate.now();
int year = today.getYear();
int month = today.getMonthValue();
int day = today.getDayOfMonth();

System.out.println("year:"+year);
System.out.println("month:"+month);
System.out.println("day:"+day);
```

### 3.处理特定日期
   
我们通过静态工厂方法 now () 非常容易地创建了当天日期，你还可以调用另一个有用的工厂方法 LocalDate.of () 创建任意日期， 该方法需要传入年、月、日做参数，返回对应的 LocalDate 实例。这个方法的好处是没再犯老 API 的设计错误，比如年度起始于 1900，月份是从 0 开 始等等。

```java
LocalDate date = LocalDate.of(2018,2,6);
System.out.println("自定义日期:"+date);
```

### 4.判断两个日期是否相等

> 使用 `equals`

```java
LocalDate date1 = LocalDate.now();
LocalDate date2 = LocalDate.of(2020,2,15);

if(date1.equals(date2)){
    System.out.println("时间相等");
}else{
     System.out.println("时间不等");
}
```

### 5.计算一周后的日期（周计算）
 
> LocalDate 日期不包含时间信息，它的 plus () 方法用来增加天、周、月，ChronoUnit 类声明了这些时间单位。由于 LocalDate 也是不变类型，返回后一定要用变量赋值。

```java
Local Date today = LocalDate.now();
System.out.println("今天的日期为:"+today);
LocalDate nextWeek = today.plus(1, ChronoUnit.WEEKS);
System.out.println("一周后的日期为:"+nextWeek);
```
### 6.计算一年前或一年后的日期

```java
LocalDate today = LocalDate.now();
   
LocalDate previousYear = today.minus(1, ChronoUnit.YEARS);
System.out.println("一年前的日期 : " + previousYear);

LocalDate nextYear = today.plus(1, ChronoUnit.YEARS);
System.out.println("一年后的日期:"+nextYear);
```

### 7.判断日期是早于还是晚于另一个日期

> 在 Java 8 中，LocalDate 类有两类方法 isBefore () 和 isAfter () 用于比较日期。调用 isBefore () 方法时，如果给定日期小于当前日期则返回 true。

```java
LocalDate today = LocalDate.now();

LocalDate tomorrow = LocalDate.of(2020,2,16);
 if(tomorrow.isAfter(today)){
    System.out.println("之后的日期:"+tomorrow);
     }

LocalDate yesterday = today.minus(1, ChronoUnit.DAYS);
if(yesterday.isBefore(today)){
    System.out.println("之前的日期:"+yesterday);
}
```

### 8.检查闰年

>  在 Java 8 中，LocalDate 类有isLeapYear()方法

```java
LocalDate today = LocalDate.now();
 if(today.isLeapYear()){
    System.out.println("This year is Leap year");
}else {
    System.out.println("2018 is not a Leap year");
}
```

## LocalTime

### 9.获取当前时间

```java
LocalTime time = LocalTime.now();
System.out.println("获取当前的时间,不含有日期:"+time);
```

### 10. 时间计算（小时计算）

> 通过增加小时、分、秒来计算将来的时间很常见。Java 8 除了不变类型和线程安全的好处之外，还提供了更好的 plusHours () 方法替换 add ()，并且是兼容的。注意，这些方法返回一个全新的 LocalTime 实例，由于其不可变性，返回后一定要用变量赋值。

```java
LocalTime time = LocalTime.now();
LocalTime newTime = time.plusHours(3);
System.out.println("三个小时后的时间为:"+newTime);
```

## Clock 

### 11. Clock 时钟类

> Java 8 增加了一个 Clock 时钟类用于获取当时的时间戳，或当前时区下的日期时间信息。以前用到 System.currentTimeInMillis () 和 TimeZone.getDefault () 的地方都可用 Clock 替换。

```java
// Returns the current time based on your system clock and set to UTC.
Clock clock = Clock.systemUTC();
System.out.println("Clock : " + clock.millis());

// Returns time based on system clock zone
 Clock defaultClock = Clock.systemDefaultZone();
System.out.println("Clock : " + defaultClock.millis());
```

## ZonedDateTime 

> ZoneId 来处理特定时区，ZoneDateTime 类来表示某时区下的时间

### 12.Java 8 中处理时区

> 这在 Java 8 以前都是 GregorianCalendar 类来做的。

```java
// Date and time with timezone in Java 8
ZoneId america = ZoneId.of("America/New_York");
LocalDateTime localtDateAndTime = LocalDateTime.now();
ZonedDateTime dateAndTimeInNewYork  = ZonedDateTime.of(localtDateAndTime, america );
System.out.println("Current date and time in a particular timezone : " + dateAndTimeInNewYork);
```

## YearMonth、MonthDay

### 13.检查像生日这种周期性事件

```java
LocalDate date1 = LocalDate.now();
LocalDate date2 = LocalDate.of(2020,2,15);

MonthDay birthday = MonthDay.of(date2.getMonth(),date2.getDayOfMonth());
MonthDay currentMonthDay = MonthDay.from(date1);

if(currentMonthDay.equals(birthday)){
   System.out.println("是你的生日");
}else{
     System.out.println("你的生日还没有到");
  }
```

> 只要当天的日期和生日匹配，无论是哪一年都会打印出祝贺信息。你可以把程序整合进系统时钟，看看生日时是否会受到提醒，或者写一个单元测试来检测代码是否运行正确。

### 14.如何表示信用卡到期这类固定日期

> YearMonth 用于表示信用卡到期日、FD 到期日、期货期权到期日等
> 得到 当月共有多少天，YearMonth 实例的 lengthOfMonth () 方法可以返回当月的天数，在判断 2 月有 28 天还是 29 天时非常有用

```java
YearMonth currentYearMonth = YearMonth.now();
System.out.printf("Days in month year %s: %d%n", currentYearMonth, currentYearMonth.lengthOfMonth());
YearMonth creditCardExpiry = YearMonth.of(2019, Month.FEBRUARY);
System.out.printf("Your credit card expires on %s %n", creditCardExpiry);
```

## 其他

### 15.计算两个日期之间的天数和月数

> 在 Java 8 中可以用 java.time.Period 类来做计算


```java
LocalDate today = LocalDate.now();

LocalDate java8Release = LocalDate.of(2018, 12, 14);

Period periodToNextJavaRelease = Period.between(today, java8Release);
System.out.println("Months left between today and Java 8 release : " + periodToNextJavaRelease.getMonths() );
```

### 16.获取当前的时间戳

```java
Instant timestamp = Instant.now();
System.out.println("What is value of this instant " + timestamp.toEpochMilli());
```
> 时间戳信息里同时包含了日期和时间，这和 java.util.Date 很像。实际上 Instant 类确实等同于 Java 8 之前的 Date 类，你可以使用 Date 类和 Instant 类各自的转换方法互相转换，例如：Date.from (Instant) 将 Instant 转换成 java.util.Date，Date.toInstant () 则是将 Date 类转换成 Instant 类。

### 17.使用预定义的格式化工具去解析或格式化日期

```java
String dayAfterTommorrow = "20180205";
LocalDate formatted = LocalDate.parse(dayAfterTommorrow,DateTimeFormatter.BASIC_ISO_DATE);
System.out.println(dayAfterTommorrow+"  格式化后的日期为:  "+formatted);
```

### 18.字符串互转日期类型


```java

LocalDateTime date = LocalDateTime.now();

DateTimeFormatter format1 = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
//日期转字符串
String str = date.format(format1);

System.out.println("日期转换为字符串:"+str);

DateTimeFormatter format2 = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
//字符串转日期
LocalDate date2 = LocalDate.parse(str,format2);
System.out.println("日期类型:"+date2);
```

## 巨人肩膀

[18 个 Java8 日期处理的实践，太有用了！](https://mp.weixin.qq.com/s/rWMYjXd6IKwmJ5cA0837HA)
