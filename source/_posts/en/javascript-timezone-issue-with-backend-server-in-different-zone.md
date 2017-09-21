---
title: Javascript timezone issue with backend server in different zone
id: 2707
categories:
  - Java Common
  - Seal
date: 2015-10-02 17:09:27
tags:
---

Today I met an problem when doing the test in the server from different timezone:

1.  Client select a date(Say 2015-10-1 ) from the form, angular populate the datetime with new Date() from javascript and pass it to server.
2.  After saving the object and then display it, it's displayed as '2015-9-30 23:00:00'. And every time after doing this, we have 1 hour difference.
Then I realize this should be a timezone issue and check the document:

"When populating the date and no timezone is specified, it default to use the local timezone from the client browser".

Since our QA server is from different timezone, we always has the 1 hour difference.

**Solution:**

We could have multiple solutions for this. But our requirement is pretty straightforward, we just want no matter which date the client selected, we have the same value saved to database. So I changed the value that we passed to server to be a string value(like '2015/10/1') and parse the date from server side, instead of using the datatime long value.

There also some other solution referred:

http://www.techrepublic.com/article/convert-the-local-time-to-another-time-zone-with-this-javascript/

http://momentjs.com/timezone/docs/