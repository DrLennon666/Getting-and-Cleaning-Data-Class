# Codebook for run_analysis.R


The output tidy data set entitled "tidy_data.txt" is a tab delmited text file written to the user's working directory.

tidy_data.txt consists of 180 observations and 66 variables and is ordered by Subject.

The first variable column contains the Subject integer identifier which ranges from 1 to 30.  Each unique subject has six entries
associated with the six activities described in the read me file.

The second variable column entitled "Activity" lists the six activities.

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

The subsequent columns 3-66 contain the mean value for the mean and std of each measurement made by the Samsung Galaxy S II for 
each subject performing each distinct activity.


They are named as follows:

mean(tBodyAcc-mean()-XYZ) 
mean(tBodyAcc-std()-XYZ)   
mean(tGravityAcc-mean()-XYZ)
mean(tGravityAcc-std()-XYZ)
mean(tBodyAccJerk-mean()-XYZ)
mean(tBodyAccJerk-std()-XYZ)
mean(tBodyGyro-mean()-XYZ)
mean(tBodyGyro-std()-XYZ)
mean(tBodyGyroJerk-mean()-XYZ)
mean(tBodyGyroJerk-std()-XYZ)
mean(tBodyAccMag-mean())
mean(tBodyAccMag-std())
mean(tGravityAccMag-mean())
mean(tGravityAccMag-std())
mean(tBodyAccJerkMag-mean())
mean(tBodyAccJerkMag-std())
mean(tBodyGyroMag-mean())
mean(tBodyGyroMag-std())
mean(tBodyGyroJerkMag-mean())
mean(tBodyGyroJerkMag-std())
mean(fBodyAcc-mean()-XYZ)
mean(fBodyAcc-std()-XYZ)
mean(fBodyAccJerk-mean()-XYZ)
mean(fBodyAccJerk-std()-XYZ)
mean(fBodyGyro-mean()-XYZ)
mean(fBodyGyro-std()-XYZ)
mean(fBodyAccMag-mean())
mean(fBodyAccMag-std())
mean(fBodyBodyAccJerkMag-mean())
mean(fBodyBodyAccJerkMag-std())
mean(fBodyBodyGyroMag-mean())
mean(fBodyBodyGyroMag-std())
