---
title: EJB3.0 和 EJB2 的区别
id: 2425
categories:
  - Java
date: 2014-01-06 14:35:23
tags:[Java, EJB]

---

1\. EJB2.0使用EntityBeans来访问数据库，EJB3.0是使用JPA（Java Persistance API）来访问数据库。

2\. EJB2.0 有部署脚本(Deployment descriptiors),EJB3.0没有。

3\. EJB3.0不需要Home接口，EJB2.0需要。

4\. EJB3.0简化了开发，引入了元数据。

5\. EJB2 限制开发人员无法在 EJB 容器外部测试 EJB 模块 ， EJB3可以更方便的使用JUnit等测试框架

6.EJB3 可以使用更多元化的SQL查询语言，包括native查询，而EJB2使用的是EJBQL。

7.EJB3的annotation的使用

8.EJB2中需要创建多个不必要的组件接口，而且要捕获一些不需要的异常信息，使用不太灵活