---
title: Multiple columns search by same keyword in SQL
date: 2017-11-09 14:10:18
categories:
  - Database
tags: Database
---
Sometime we have requirement to do fuzzy search in multiple columns of a database table.
For example:

A Person table has below columns:

Id | Name | CellPhone | WorkPhone | HomePhone

**Try to search the pearson with any phoneNumber has 666.**

**The normal way might be:**

    select * from Person where cellPhone like '%666%' or workPhone like '%666%' or homePhone like '%666%'

This gonna be a performance issue if the rows are huge in the table.

**A better way to do this:**

    select * from Person where contact(cellPhone, '/', workPhone, '/', homePhone) like '%666%'