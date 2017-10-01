---
title: nvarchar与varchar的区别
id: 201
categories:
  - Database
date: 2010-11-29 10:51:15
tags: Database
---

nvarchar与varchar的区别&amp;lt;/p&gt;

varchar[(n)]
长度为   n   个字节的可变长度且非   Unicode   的字符数据。n
必须是一个介于   1   和   8,000   之间的数值。存储大小为输入数据的字节的实际长度，而不是   n
个字节。所输入的数据字符长度可以为零。varchar   在   SQL-92   中的同义词为   char   varying   或
character   varying。

nvarchar(n)
包含   n
个字符的可变长度   Unicode   字符数据。n   的值必须介于   1   与   4,000
之间。字节的存储大小是所输入字符个数的两倍。所输入的数据字符长度可以为零。nvarchar   在   SQL-92   中的同义词为
national   char   varying   和   national   character   varying。&amp;amp;nbsp;

通俗一點就是varchar適合輸入英文和數字，nvarchar一般用做中文或其它語言的輸入，這樣到別的語系不會出現亂碼:))