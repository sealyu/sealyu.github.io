---
title: Red–black BST with no extra memory
id: 2841
categories:
  - Algorithm
date: 2017-05-16 13:54:16
tags: Algorithm
---

I am in  a couresa course for algorithm, and in the quiz there's 1 question:

<span style="color: #ff6600;">_Red–black BST with no extra memory. Describe how to save the memory for storing the color information when implementing a red–black BST._</span>


I saw some posts which are talking about using pointer(like c or c++ which support pointer) to store the color infomration. But for java, there's no concept like pointer.

So 1 solution is to modify the BST tree structure, using the different order to flag the color information:

Red: Store the color information in the right side node of the red link, as chart below, store the information in node C/J/X.

[![](http://blog-sealyu.rhcloud.com/wp-content/uploads/2017/05/Screen-Shot-2017-05-16-at-10.34.29-AM.png)](http://blog-sealyu.rhcloud.com/wp-content/uploads/2017/05/Screen-Shot-2017-05-16-at-10.34.29-AM.png)

Using inverse order other than original BST tree, means put it's larger child to left and smaller child to right for those nodes which store the color information. No matter it has 1 or 2 child, if the color is red, then use the inverse order, and use original order if it's black. Since the node with red color always has at least 1 left child, then this structure will be able to store the color information without any extra memory cost.