# UCI HAR Dataset Avg dataset

## Description

Course project for Coursera "Getting and Cleaning Data" course.

This dataset is a condensation of the UCI HAR dataset (referred to below
as "the original data"), derived as follows:

- The test and training datasets in the original data have been combined.

- The subject-ID, activity-ID and activity-name are contained in separate
files in the original data.  In this dataset, they are combined with the
corresponding measurement data and are present in the first three columns.

- Only the MEAN and STD measurements are retained.  These consist of the
columns in the original data whose names contain the strings "mean()" and
"std()", respectively.

- The data has been summarized so that there is one record per subject, per
activity.  The multiple measurement records in the original data have been
averaged over the subject and activity.  The string "-avg" has been appended
to the original measurement names to reflect this.

## Columns

The dataset includes the following columns:

 [1] "activity_id"                        
 [2] "activity_name"                      
 [3] "subject_id"                         
 [4] "tBodyAcc-mean()-X-avg"              
 [5] "tBodyAcc-mean()-Y-avg"              
 [6] "tBodyAcc-mean()-Z-avg"              
 [7] "tBodyAcc-std()-X-avg"               
 [8] "tBodyAcc-std()-Y-avg"               
 [9] "tBodyAcc-std()-Z-avg"               
[10] "tGravityAcc-mean()-X-avg"           
[11] "tGravityAcc-mean()-Y-avg"           
[12] "tGravityAcc-mean()-Z-avg"           
[13] "tGravityAcc-std()-X-avg"            
[14] "tGravityAcc-std()-Y-avg"            
[15] "tGravityAcc-std()-Z-avg"            
[16] "tBodyAccJerk-mean()-X-avg"          
[17] "tBodyAccJerk-mean()-Y-avg"          
[18] "tBodyAccJerk-mean()-Z-avg"          
[19] "tBodyAccJerk-std()-X-avg"           
[20] "tBodyAccJerk-std()-Y-avg"           
[21] "tBodyAccJerk-std()-Z-avg"           
[22] "tBodyGyro-mean()-X-avg"             
[23] "tBodyGyro-mean()-Y-avg"             
[24] "tBodyGyro-mean()-Z-avg"             
[25] "tBodyGyro-std()-X-avg"              
[26] "tBodyGyro-std()-Y-avg"              
[27] "tBodyGyro-std()-Z-avg"              
[28] "tBodyGyroJerk-mean()-X-avg"         
[29] "tBodyGyroJerk-mean()-Y-avg"         
[30] "tBodyGyroJerk-mean()-Z-avg"         
[31] "tBodyGyroJerk-std()-X-avg"          
[32] "tBodyGyroJerk-std()-Y-avg"          
[33] "tBodyGyroJerk-std()-Z-avg"          
[34] "tBodyAccMag-mean()-avg"             
[35] "tBodyAccMag-std()-avg"              
[36] "tGravityAccMag-mean()-avg"          
[37] "tGravityAccMag-std()-avg"           
[38] "tBodyAccJerkMag-mean()-avg"         
[39] "tBodyAccJerkMag-std()-avg"          
[40] "tBodyGyroMag-mean()-avg"            
[41] "tBodyGyroMag-std()-avg"             
[42] "tBodyGyroJerkMag-mean()-avg"        
[43] "tBodyGyroJerkMag-std()-avg"         
[44] "fBodyAcc-mean()-X-avg"              
[45] "fBodyAcc-mean()-Y-avg"              
[46] "fBodyAcc-mean()-Z-avg"              
[47] "fBodyAcc-std()-X-avg"               
[48] "fBodyAcc-std()-Y-avg"               
[49] "fBodyAcc-std()-Z-avg"               
[50] "fBodyAcc-meanFreq()-X-avg"          
[51] "fBodyAcc-meanFreq()-Y-avg"          
[52] "fBodyAcc-meanFreq()-Z-avg"          
[53] "fBodyAccJerk-mean()-X-avg"          
[54] "fBodyAccJerk-mean()-Y-avg"          
[55] "fBodyAccJerk-mean()-Z-avg"          
[56] "fBodyAccJerk-std()-X-avg"           
[57] "fBodyAccJerk-std()-Y-avg"           
[58] "fBodyAccJerk-std()-Z-avg"           
[59] "fBodyAccJerk-meanFreq()-X-avg"      
[60] "fBodyAccJerk-meanFreq()-Y-avg"      
[61] "fBodyAccJerk-meanFreq()-Z-avg"      
[62] "fBodyGyro-mean()-X-avg"             
[63] "fBodyGyro-mean()-Y-avg"             
[64] "fBodyGyro-mean()-Z-avg"             
[65] "fBodyGyro-std()-X-avg"              
[66] "fBodyGyro-std()-Y-avg"              
[67] "fBodyGyro-std()-Z-avg"              
[68] "fBodyGyro-meanFreq()-X-avg"         
[69] "fBodyGyro-meanFreq()-Y-avg"         
[70] "fBodyGyro-meanFreq()-Z-avg"         
[71] "fBodyAccMag-mean()-avg"             
[72] "fBodyAccMag-std()-avg"              
[73] "fBodyAccMag-meanFreq()-avg"         
[74] "fBodyBodyAccJerkMag-mean()-avg"     
[75] "fBodyBodyAccJerkMag-std()-avg"      
[76] "fBodyBodyAccJerkMag-meanFreq()-avg" 
[77] "fBodyBodyGyroMag-mean()-avg"        
[78] "fBodyBodyGyroMag-std()-avg"         
[79] "fBodyBodyGyroMag-meanFreq()-avg"    
[80] "fBodyBodyGyroJerkMag-mean()-avg"    
[81] "fBodyBodyGyroJerkMag-std()-avg"     
[82] "fBodyBodyGyroJerkMag-meanFreq()-avg"
