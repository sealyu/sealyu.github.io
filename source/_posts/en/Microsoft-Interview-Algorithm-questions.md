---
title: Microsoft Interview Algorithm questions
date: 2018-05-01 23:41:39
categories: 
  - Algorithm 
tags: [Algorithm, Interview] 
---

## Question1:

Merge 2 sorted linked list(In ascendant order, duplicate allowed)do not use recursion.It takes in two already sorted linked lists (in ascendant order, duplicates allowed) and is supposed to merge them into a single sorted linked list (in ascendant order, duplicates allowed) and returns the new head.
       
## Solution1:   

This is a simple algorithm quesiton, we can definitely make the time complexity O(n).

	/**
     * Merge 2 sorted linked list into a single sorted linked list.
     * @param startNode1 The start node of linked list 1
     * @param startNode2 The start node of linked list 2
     * @return The merged sorted linked list
     */
	private Node mergeSortedLinkedList(Node startNode1, Node startNode2){
        Node headerNode = new Node(0);
        Node lastNode = headerNode;

        //Loop and compare the node between list 1 and list 2 until any of them end.
        while (startNode1 != null && startNode2 != null) {
            if (startNode1.data < startNode2.data) {
                lastNode.next = startNode1;
                startNode1 = startNode1.next;
            } else {
                lastNode.next = startNode2;
                startNode2 = startNode2.next;
            }
            lastNode = lastNode.next;
        }

        //Append the un-finished one to the result
        if (startNode1 != null) {
            lastNode.next = startNode1;
        } else {
            lastNode.next = startNode2;
        }

        return headerNode.next;
	}
	

## Question2:

Given a list of scope and value pair like ([0,100] 1, [20,50) 3, [30,50] -3, (50,60] 2), find the maximum overlap value. Make the time complexity O(n)
       
## Solution2:   

This is similar to the problem referred in [Maximum number of overlapping intervals – Merge Overlapping Intervals – Max Task Load](http://www.zrzahid.com/maximum-number-of-overlapping-intervals/)

Another version of this problem could be –

Given a list of n Jobs with start time, end time and CPU load when it is active at any moment. If all the jobs are running at the same machine then find the maximum CPU load at any time.

For example, let’s define a job as a tuple of (start_time, end_time, weight) where weight is the load of that job at any time when active. Then,

	jobs = {(3, 7, 4), (1, 3, 6), (4, 9, 5)} –> max load = 10.
	jobs = {(3, 7, 4), (1, 3, 6), (4, 9, 5), (10, 11, 11)} –> max load = 11.
	jobs = {(3, 7, 4), (1, 3, 6), (4, 9, 5), (10, 11, 11),(3, 4, 2)} –> max load = 12.

Note that, this is similar to finding maximum overlap where we maximize total weight (i.e. load) instead of maximizing total number of overlaps. We can similarly sort the jobs based on start and end time in separate arrays and then find overlap incrementally as we did previously. Each time we have one more overlapping interval we update current load with the current job and keep updating global max. When we see an interval to end then we need to subtract the load of this job from the running load. Below is a O(nLogn) time algorithm to find the max total load of all the jobs active at certain time.


		public static int maxLoad(Job[] jobs){
			int maxLoad = 0;
			int curLoad = 0;
			
			Job[] start = Arrays.copyOf(jobs, jobs.length);
			Job[] end = Arrays.copyOf(jobs, jobs.length);
			
			Arrays.sort(start, new Comparator<Job>() {
		
				@Override
				public int compare(Job o1, Job o2) {
					return Integer.compare(o1.start, o2.start);
				}
			});
			Arrays.sort(end, new Comparator<Job>() {
		
				@Override
				public int compare(Job o1, Job o2) {
					return Integer.compare(o1.finish , o2.finish);
				}
			});
			
			int i = 0, j = 0;
			while(i < start.length && j < end.length){
				if(start[i].start <= end[j].finish){
					curLoad += start[i].weight;
					maxLoad = Math.max(maxLoad, curLoad);
					i++;
				}
				else{
					curLoad -= end[j].weight;
					j++;
				}
			}
			
			return maxLoad;
		}

## Question3:

Given an unsorted integer array, find the smallest missing positive integer.

Example 1:

	Input: [1,2,0]
	Output: 3
Example 2:

	Input: [3,4,-1,1]
	Output: 2
Example 3:

	Input: [7,8,9,11,12]
	Output: 1
Note:

Your algorithm should run in O(n) time and uses constant extra space.
       
## Solution3:   
A simple way to make it work is to sort the array using QuickSort and loop the array to find the first missing positive number. But the time complexity then becomes O(N*LogN) and does not meet the requirement.
Then the solution would be to use the index of the array:

1. First loop the array, compare the value of the postion and it's index, try to put all numbers to the place so array[i] = i+1.
2. Then loop the array and the first element whose value does not equal index+1 is the missing value. If all matchs, then the length+1 should be the first one missing.

	
		public int firstMissingPositive(int[] nums) {
	        int len = nums.length;
	        //Loop the array, only process the positive number, put all the value to the index to make it nums[i] = i
	        for(int i = 0; i < len; i++){
	            while(nums[i] > 0 && nums[i] <= len && nums[nums[i] - 1] != nums[i]){
	                swap(nums, i, nums[i] - 1);
	            }
	        }
	        //The first index whose value does not equal index+1 is the missing value
	        for(int i = 0; i < len; i++){
	            if(nums[i] != i + 1)
	                return i + 1;
	        }
	        //If all matchs, then the length + 1 should be the first missing postive number
	        return len + 1;
	    }
	    
	    private void swap(int[] array, int start, int end){
	        int temp = array[start];
	        array[start] = array[end];
	        array[end] = temp;
	    }

## Question4:

Given a set of integer A(s1,s2,s3,...), S is A's sub set. Given S1`|S2`|S3'|.. =X(按位或), find after deleting number N from A to make all S can't generate Y. Make it O(n).
       
## Solution4:   

1. Get the positions of the bits of Y which equals 
2. Create a HashTable with length 32, every key stores the number of values whose bit on this key equal 1.
3. Loop all integer numbers of A, for every value, update the HashTable, for all postison of the bits equal 1, update the hashtable[position]++
4. Find the minimum value of the Hashtable, is the number of smallest number of elements need to be deleted. After deleting these elements, it will not be able to generate the Y, because there's 1 bit which can't be 1. 

## Question5:

Convex hull problem: Given a plane and many points, find the convex hull so all points either inside of the hull or on the edge.

	Input: A set of points
	Output: The set of points on the edge.


       
## Solution5:   

The detail solution can ben found [GrahamScan.java](https://algs4.cs.princeton.edu/99hull/GrahamScan.java.html)

## Reference
1. [Maximum number of overlapping intervals – Merge Overlapping Intervals – Max Task Load](http://www.zrzahid.com/maximum-number-of-overlapping-intervals/)
2. [Convex Hull] (https://en.wikipedia.org/wiki/Convex_hull)
3. [Graham scan] (https://en.wikipedia.org/wiki/Graham_scan)
4. [GrahamScan.java](https://algs4.cs.princeton.edu/99hull/GrahamScan.java.html)
5. [凸包（Convex Hull）](https://zhuanlan.zhihu.com/p/33355636)