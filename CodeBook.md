
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

TimeBodyAcc-XYZ
TimeGravityAcc-XYZ
TimeBodyAccJerk-XYZ
TimeBodyGyro-XYZ
TimeBodyGyroJerk-XYZ
TimeBodyAccMag
TimeGravityAccMag
TimeBodyAccJerkMag
TimeBodyGyroMag
TimeBodyGyroJerkMag
FrequencyBodyAcc-XYZ
FrequencyBodyAccJerk-XYZ
FrequencyBodyGyro-XYZ
FrequencyBodyAccMag
FrequencyBodyAccJerkMag
FrequencyBodyGyroMag
FrequencyBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value -- labeled "Mean" in the final dataset
std(): Standard deviation -- labeled "StDev" in the final dataset
meanFreq(): Weighted average of the frequency components to obtain a mean frequency -- labeled "MeanFreq" in the final dataset

The data from the test and train measurements have been combined into one tidy dataset and averaged by Subject and Activity.

The output file ˜tidy_data_mcdarr.txt" can be pulled into R with the following command:

R> read.table("tidy_data_mcdarr.txt")

Each row of the dataset contains the average measurment for each Subject and Activity combination for each of the mean, standard deviation, and mean frequency measures. For example, the first row of the file shows the average measures for Subject #1 while Laying.
