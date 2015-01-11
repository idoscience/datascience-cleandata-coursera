Getting and Cleaning Data Course Project
========================================

This repository is for the course project of the course Getting and cleaning data in Coursera.

It consists of run_analysis.r script which performs the task fo tidying up the data.

Workflow
========

1. At first it loads required library plyr.
2. After that, it loads all the test and train files with read.table function. It assumes that the provided zip file has been unzipped in the same folder.
3. Only the column containing mean and std variables are extracted using grep function.
4. The activity number has been converted to their corresponding name from the activity_labels.txt
5. Subject and activity has been labelled as "Subject" and "Activity"
6. All the data has been added to a single variable.
7. The data has been tidied up with the average of each variable for each activity and each subject with ddply function
8. Finally, the tidied data has been saved in a file named tidy_data.txt which has been attached in coursera as per the guideline in the peer assesment.

