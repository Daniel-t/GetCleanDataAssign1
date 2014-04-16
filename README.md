# Cleanup of the UCI HAR Dataset
### Getting & Cleaning Data Assignment

This repository contains the scripts (and accossiated documentation) required to transforming the UCI HAR dataset into a form that is suitable for further processing.

The specific files are:
* README.md - this file
* CodeBook.md - Describes the variables, data and transformations performed to clean up the data (as performed by run_analysis.R)
* run_analysis.R - performs the cleanup and transformations discussed in the Codebook, this assumes that the UCI HAR Dataset folder is in the current working directory.

The run_analysis script performs the following tasks  
1. Load raw data  
  Load the subject_train, trainX, trainy, subject_train, testX  & testy data sets  
  Also loads the Activity.txt, features.txt data files  
2. Merge data  
  Merge the train and test data into combined datasets   
3. Strip out unwanted columes from the combined X dataset  
  This is done my identiyfying the columns containing 'mean()' or 'std()' and creating a dataset which only contains those columns  
4. Add column names and combine rows  
  Combining the SubjectId, Activity and data datasets into a master table  
  The Activity column is also transformed from numbers to the labelled activity, as per the 'activity' file in the original data.  
5. Summarise data, all data is summarised by obtaining the mean for all obserations for each subjectId,Activity combination.  
6. The summarised data is returned to the calling user.  

The original dataset is not included here, but can be obtained from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
