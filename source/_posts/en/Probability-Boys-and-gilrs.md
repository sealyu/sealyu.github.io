---
title: Probability - Boys and girls
date: 2017-11-10 23:23:06
categories: 
  - Algorithm 
tags: Algorithm 
---

## Questions:

In a country where everyone wants a boy, each family continues having babies till they have a boy. After some time, what is the proportion of boys to girls in the country? (Assuming probability of having a boy or a girl is the same)

                
## Solution:          

Assume finally the numbers of boys is C. Then:

    Number of girls = 0*(Probability of 0 girls) + 1*(Probability of 1 girl) + 2*(Probability of 2 girls) + …
	Number of girls = 0*(C*1/2) + 1*(C*1/2*1/2) + 2*(C*1/2*1/2*1/2) + …
	Number of girls = 0 + C/4 + 2*C/8 + 2*C/16 + …
	Number of girls = C
	(using mathematical formulas; it becomes apparent if you just sum up the first 4-5 terms)     
	
### Without using math:
Logically thinking, It stays 50%. As long as the chance for each child is 50%, it won't change.
### Using math:

   {% asset_img sum-girls.png Girs Number %}
## Answer

Boys and Girls ratio: 1:1