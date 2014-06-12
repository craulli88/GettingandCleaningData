GettingandCleaningData
======================

1)  My script first reads in the three data files from the 'train' folder.

2)  Next, it should merge all of the columns of the three files by using the cbind command twice.

3)  The x_train file had 561 columns and the other two just had one column each, so the new dataframe after being merged had 563 columns.

4)  Next, the same thing is done for the files in the 'test' folder.

5)  The final dataframe from 'train' and the final dataframe from 'test' are then merged with a rbind, adding their rows together with the same columns.

6)  Looking at the provided 'features.txt' file I determined which measurements were either for mean or standard deviation by looking for every one that contained a std() or mean().

7)  I noted the column numbers and then dropped all the other columns that werent needed from my dataframe

8)  Then, I simply renamed each activity variable (1-6) with more descriptive names, along with renaming the Activity and Subjects columns.

9)  Finally I tidied up the data by using the melt and cast functions to give me a 6x30 dataframe with the  average of each variable for each activity and each subject.

10)  I then wrote this to a text file.
