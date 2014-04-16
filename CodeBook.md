# CodeBook

THe documents describes the data outputed from run_analysis and the process used to create the same from the raw data.

## Variables

### SubjectId
SubjectId refers the the subject who's activity was measured to create the observation, valid Subject Id's are in the range 1-30

### Activity
This field describes the activity that was measured, it will be one of "LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS"

### Observation recordings 
The remainder of the fields are the mean values for a given subject and activity of each mean() and std() reading in the original dataset.  See features_info.txt in the UCI HAR Dataset for specific details about the fields.
Many readings were taken across the three (X,Y & Z) axis and have seperate mean() and std() observations for each.

The specific fields are:
*tBodyAcc-mean()-[XYZ]   tBodyAcc-std()-[XYZ]  
*tGravityAcc-mean()-[XYZ]  tGravityAcc-std()-[XYZ]     
*tBodyAccJerk-mean()-[XYZ] tBodyAccJerk-std()-[XYZ]       
*tBodyGyro-mean()-[XYZ]  tBodyGyro-std()-[XYZ]
*tBodyGyroJerk-mean()-[XYZ]  tBodyGyroJerk-std()-[XYZ]    
*tBodyAccMag-mean()  tBodyAccMag-std()          
*tGravityAccMag-mean() tGravityAccMag-std()       
*tBodyAccJerkMag-mean()  tBodyAccJerkMag-std()
*tBodyGyroMag-mean() tBodyGyroMag-std()
*tBodyGyroJerkMag-mean() tBodyGyroJerkMag-std()
*fBodyAcc-mean()-[XYZ] fBodyAcc-std()-[XYZ]
*fBodyAccJerk-mean()-[XYZ] fBodyAccJerk-std()-[XYZ]
*fBodyGyro-mean()-[XYZ]  fBodyGyro-std()-[XYZ]          
*fBodyAccMag-mean()  fBodyAccMag-std()        
*fBodyBodyAccJerkMag-mean()  fBodyBodyAccJerkMag-std()
*fBodyBodyGyroMag-mean() fBodyBodyGyroMag-std()     
*fBodyBodyGyroJerkMag-mean() fBodyBodyGyroJerkMag-std()

Each of the obsercations is was normalised to be between -1 and 1 prior to being received.

## Transformations & Cleanup
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

  

