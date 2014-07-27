I didn't change the names

As described in the features_info.txt file that came with the data:

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Even though there were multiple variables that were measured, we only took the mean and standard deviation:

mean(): Mean value
std(): Standard deviation 

I also included the subject and activity:

subject takes distinct values from 1 to 30 and represents the individuals that participated in the study.

activity is the type of activity that the subjects undertook and there are 6 distinct activities:
	WALKING
	WALKING_UPSTAIRS
	WALKING_DOWNSTAIRS
	SITTING
	STANDING
	LAYING

The resulting tidy data frame shows the average values for the activities by subject and by activity.
