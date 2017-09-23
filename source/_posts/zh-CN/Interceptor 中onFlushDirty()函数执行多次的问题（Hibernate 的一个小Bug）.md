---
title: Interceptor 中onFlushDirty()函数执行多次的问题（Hibernate 的一个小Bug）
id: 1069
categories:
  - Java
date: 2008-05-09 07:59:00
tags: Java
---

最近在项目中遇到一个奇怪的问题，在使用Hibernate拦截器捕获实体变化并进行处理时，发现其中的onFlushDirty()函数执行了很多次，导致进行处理时产生很多重复数据。具体问题如下：
使用一个类继承Hibernate的EmptyInterceptor类来对程序中的实体变化进行拦截，并在其中的onFlushDirty()函数中对捕获的数据进行处理，产生对应的event数据并保存到数据库中。 例如：&lt;br /&gt;
public class EventInterceptor extends EmptyInterceptor {
public boolean onFlushDirty(
Object entity,
Serializable id,
Object[] currentState,
Object[] previousState,
String[] propertyNames,
Type[] types ) throws CallbackException {

if(isAuditable(entity)){//如果该实体需要被记录，生成对应的event。&lt;br /&gt;
//此处生成对应的event。&lt;br /&gt;
}
return false;
}

在程序执行后，发现对应一条实体的变化生成了多条重复的event记录，非常不解。&lt;br /&gt;
后来google发现，有人也碰到过对应的问题，并在Hibernage论坛中提出过这个问题，鉴定为Hibernate的一个小Bug。&lt;br /&gt;
（原文地址：http://forum.hibernate.org/viewtopic.php?t=940410&amp;highlight=interceptor+onflushdirty）&lt;br /&gt;
解决方法如下：&lt;br /&gt;
将FlushMode改为：FlushMode.COMMIT
或者也可以提前进行flush()
都可以解决这个问题。&lt;br /&gt;