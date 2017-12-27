---
title: Pandas Selection by Position 
date: 2017-12-27 14:02:33
categories:
  - Machine Learning
tags: [Machine Learning, Python]
---

There are multiple ways to select and index rows and columns from Pandas DataFrames:

**Selection Options**

There’s three main options to achieve the selection and indexing activities in Pandas, which can be confusing. The three selection cases and methods covered in this post are:

* Selecting data by row numbers (.iloc). Purely integer-location based indexing for selection by position. It is primarily integer position based (from 0 to length-1 of the axis), but may also be used with a boolean array.
* Selecting data by label or by a conditional statment (.loc). It is primarily label based, but may also be used with a boolean array
* Selecting in a hybrid approach (.ix) (now Deprecated in Pandas 0.20.1)

Below are some examples:

**iloc:**

    # Single selections using iloc and DataFrame
    # Rows:
    data.iloc[0] # first row of data frame (Aleshia Tomkiewicz) - Note a Series data type output.
    data.iloc[1] # second row of data frame (Evan Zigomalas)
    data.iloc[-1] # last row of data frame (Mi Richan)
    # Columns:
    data.iloc[:,0] # first column of data frame (first_name)
    data.iloc[:,1] # second column of data frame (last_name)
    data.iloc[:,-1] # last column of data frame (id)
    
    # Multiple row and column selections using iloc and DataFrame
    data.iloc[0:5] # first five rows of dataframe
    data.iloc[:, 0:2] # first two columns of data frame with all rows
    data.iloc[[0,3,6,24], [0,5,6]] # 1st, 4th, 7th, 25th row + 1st 6th 7th columns.
    data.iloc[0:5, 5:8] # first 5 rows and 5th, 6th, 7th columns of data frame (county -> phone1).
    
**loc**   
 
    # Select rows with index values 'Andrade' and 'Veness', with all columns between 'city' and 'email'
    data.loc[['Andrade', 'Veness'], 'city':'email']
    # Select same rows, with just 'first_name', 'address' and 'city' columns
    data.loc['Andrade':'Veness', ['first_name', 'address', 'city']]
     
    # Change the index to be based on the 'id' column
    data.set_index('id', inplace=True)
    # select the row with 'id' = 487
    data.loc[487]   
    
## Reference
1. [Pandas Data Selection](https://www.shanelynn.ie/select-pandas-dataframe-rows-and-columns-using-iloc-loc-and-ix/)
