---
title: Probability of death
draft: true
date: 2018-05-14 14:02:08
categories: 
  - Algorithm 
tags: Algorithm 
---
## Questions:

There is an island which is represented by square matrix nxn.

A person on the island is standing at any given co-ordinates (x,y). He can move in any direction one step right, left, up, down on the island. If he steps outside the island, he dies.

Let the island be represented as (0,0) to (n-1,n-1) (i.e nxn matrix) & person is standing at given co-ordinates (x,y). He is allowed to move n steps on the island (along the matrix). What is the probability that he is dead after he walks n steps on the island?
                
## Solution:          

Recursion. (Or "mathematical induction", if you're snobbish.)

(In what follows, "he is dead after he walks n steps on the island" is assumed to mean "he dies after less than or equal to n steps". If you take it to mean "he dies after exactly n steps", the answer will be slightly different. I'll discuss it briefly at the end.)

We have an NxN matrix where the value in each cell represents the probability of dying in n steps if we started from that cell.

Consider the probability of dying in 0 steps. Clearly, this is 0.0 for every location inside the island, and 1.0 everywhere outside it.

What's the probability of dying in 1 steps? You have four directions you can move in, with equal probability. So for each cell, you take its four neighbors, find their probability of dying in 0 steps, and average them together. (If a neighbor is outside the matrix, you consider its probability to be 1.0.)

Similarly, the probability of dying in k steps starting from a given cell is the average of the probability of dying in k-1 steps starting from its neighbour cells.

Python code:

from itertools import product as prod 

    def prob_death(island_size, steps):
        if island_size < 1 or steps < 0: raise ValueError
        new_prob = [[0. for i in range(island_size)] for j in range(island_size)]
        if steps == 0:
            return new_prob
        old_prob = prob_death(island_size, steps - 1)
        directions = [(0, -1), (1, 0), (0, 1), (-1, 0)]
        for (i, j, direction) in prod(range(island_size), range(island_size), directions):
            neighbor_i = i + direction[0]
            neighbor_j = j + direction[1]
            if neighbor_i >= 0 and neighbor_i < island_size and \
                    neighbor_j >= 0 and neighbor_j < island_size:
                prob_death_this_way = old_prob[neighbor_i][neighbor_j]
            else: # neighbor is outside the island 
                prob_death_this_way = 1.
            new_prob[i][j] += 0.25* prob_death_this_way
        return new_prob

Now, let's test it out a bit: (mpr is just a function for printing matrices nicely)

    >>> mpr(prob_death(5, 0))
    0.000000 0.000000 0.000000 0.000000 0.000000
    0.000000 0.000000 0.000000 0.000000 0.000000
    0.000000 0.000000 0.000000 0.000000 0.000000
    0.000000 0.000000 0.000000 0.000000 0.000000
    0.000000 0.000000 0.000000 0.000000 0.000000

As expected: You can't die in 0 steps if you start inside the island.

    >>> mpr(prob_death(5,1))
    0.500000 0.250000 0.250000 0.250000 0.500000
    0.250000 0.000000 0.000000 0.000000 0.250000
    0.250000 0.000000 0.000000 0.000000 0.250000
    0.250000 0.000000 0.000000 0.000000 0.250000
    0.500000 0.250000 0.250000 0.250000 0.500000
This is what we'd expect. If you start at a corner cell, you have 0.5 probability of dying in 1 step: 2 out of your 4 neighbors are outside the island. If you start on an edge, only 1 neighbor is outside, so your probability of dying is 0.25. Everywhere else, all neighbors are inside the island, so probability of dying in 1 step is 0.0.

    >>> mpr(prob_death(5, 5))
    0.806641 0.666016 0.622070 0.666016 0.806641
    0.666016 0.437500 0.349609 0.437500 0.666016
    0.622070 0.349609 0.261719 0.349609 0.622070
    0.666016 0.437500 0.349609 0.437500 0.666016
    0.806641 0.666016 0.622070 0.666016 0.806641
The probability of dying in 5 steps. I can't verify the exact values, but it looks about right: The probability of dying is highest in the corners, a little lower at the edges, and decreases steadily inwards.

That solves the problem of dying in less than or equal to n steps.

Now, to find the probability of dying in exactly n steps: Let the probability of dying in less than or equal to n steps starting from (x,y) be denoted by P(x,y,n). Then the probability of dying in exactly n steps is the probability of surviving for n-1 steps, times the probability of dying in the nth step given that we survived for n-1 steps: (1-P(x,y,n-1))*(P(x,y,n) - P(x,y,n-1)). (I'm not all that sure about this formula; correct me if I'm wrong.)

## Reference
1. [Probability of death of a man moving n steps in a matrix](https://stackoverflow.com/questions/16522296/probability-of-death-of-a-man-moving-n-steps-in-a-matrix?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa)