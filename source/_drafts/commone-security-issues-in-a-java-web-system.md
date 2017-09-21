---
title: Commone Security issues in  Java Web System
id: 2754
categories:
  - Seal
  - Security
tags:
---

## 

## 1\. Web Server Security

A standard web application usually has following sensitive security data:

1.  Database connection files:

    *   .properties file
    *   .xml file

2.  Encryption key
3.  Keystore
&nbsp;

## 2\. Database Security

Sensitive data like SSN and credit card should be encrypted.

## 3. Code Level Security

https://www.owasp.org/index.php/OWASP_Java_Encoder_Project

## 4\. Encryption/Decryption

1.  ### File encryption/decryption

    PGP
2.  ### Password encryption/decryption

    TODO://

## 5\. Avoid Hacker

1.  ### SQL Injection

    The Open Web Application Security Project (OWASP) has a cheat sheet for how to avoid the SQL injection

    https://www.owasp.org/index.php/SQL_Injection_Prevention_Cheat_Sheet
2.  ### Cross site scripting
https://www.owasp.org/index.php/OWASP_Java_Encoder_Project

## 

## 6\. Java Authentication and Authorization Service (JAAS)

http://docs.oracle.com/javase/7/docs/technotes/guides/security/jaas/JAASRefGuide.html