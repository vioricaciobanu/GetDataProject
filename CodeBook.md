# STUDY DESIGN
## These are excerpts from the READ.ME file and "features_info" that describe the raw dataset.
###Features are normalized and bounded within [-1,1]
"
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
Features are normalized and bounded within [-1,1]

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
"
##These are the variables for the measurements
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

The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

# The steps for tidying the data
The raw datasets includes the files "X_train.txt" (training set), "subject_train.txt"(training subjects),'y_train.txt' (training activities),'X_test.txt' (Test set), "subject_test.txt"(test subjects),'y_test.txt'(test activities ), 'features.txt' (List of all measurements),'activity_labels.txt'(Links the class labels with their activity name)

The tidy dataset is contained in the file "mean_activity_subject.txt". It was  obtained following the next steps.

1. The measurement names were added to the the training and test datasets from the features file.
2. The subjects and activities were added to the training and test datasets. 
3. The training dataset(7352 rows and 563 columns) and test dataset (2947 rows and 563 colums) were merged together.
4. Only the columns containing data about mean and standard deviation of the measurements were extracted for the tidy dataset, 66 columns in total.
5. The names of the columns were changed to camelCase type, excluding all the special caracters as "-,()".  Also the names were made more descriptive as "time" for "t", "frequency" for "f", "Accelerometer" for "Acc", "Gyroscope" for "Gyro", "Magnitude" for "Mag", "Xaxis" for "X","Yaxis" for "Y","Zaxis" for "Z"
6. The activity names were changed from numbers to descriptive names (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
7. Last step was to calculate the average of each measurement for each activity and each subject.

#The tidy dataset
## The tidy dataset has 68 columns and 180 rows. Each row is an observation (the mean of each measurement by subject and activity) and each column is an variable.
This is the set of variables.
Subject: 30 subjects, labelled 1 to 30
Activity: 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
and the next 66 variables are grouped means of the same variables in the raw dataset.
timeBodyAccelerometerXaxisMean
timeBodyAccelerometerYaxisMean
timeBodyAccelerometerZaxisMean
timeGravityAccelerometerXaxisMean
timeGravityAccelerometerYaxisMean
timeGravityAccelerometerZaxisMean
timeBodyAccelerometerJerkXaxisMean
timeBodyAccelerometerJerkYaxisMean
timeBodyAccelerometerJerkZaxisMean
timeBodyGyroscopeXaxisMean
timeBodyGyroscopeYaxisMean
timeBodyGyroscopeZaxisMean
timeBodyGyroscopeJerkXaxisMean
timeBodyGyroscopeJerkYaxisMean
timeBodyGyroscopeJerkZaxisMean
timeBodyAccelerometerMagnitudeMean
timeGravityAccelerometerMagnitudeMean
timeBodyAccelerometerJerkMagnitudeMean
timeBodyGyroscopeMagnitudeMean
timeBodyGyroscopeJerkMagnitudeMean
frequencyBodyAccelerometerXaxisMean
frequencyBodyAccelerometerYaxisMean
frequencyBodyAccelerometerZaxisMean
frequencyBodyAccelerometerJerkXaxisMean
frequencyBodyAccelerometerJerkYaxisMean
frequencyBodyAccelerometerJerkZaxisMean
frequencyBodyGyroscopeXaxisMean
frequencyBodyGyroscopeYaxisMean
frequencyBodyGyroscopeZaxisMean
frequencyBodyAccelerometerMagnitudeMean
frequencyBodyBodyAccelerometerJerkMagnitudeMean
frequencyBodyBodyGyroscopeMagnitudeMean
frequencyBodyBodyGyroscopeJerkMagnitudeMean
timeBodyAccelerometerXaxisStd
timeBodyAccelerometerYaxisStd
timeBodyAccelerometerZaxisStd
timeGravityAccelerometerXaxisStd
timeGravityAccelerometerYaxisStd
timeGravityAccelerometerZaxisStd
timeBodyAccelerometerJerkXaxisStd
timeBodyAccelerometerJerkYaxisStd
timeBodyAccelerometerJerkZaxisStd
timeBodyGyroscopeXaxisStd
timeBodyGyroscopeYaxisStd
timeBodyGyroscopeZaxisStd
timeBodyGyroscopeJerkXaxisStd
timeBodyGyroscopeJerkYaxisStd
timeBodyGyroscopeJerkZaxisStd
timeBodyAccelerometerMagnitudeStd
timeGravityAccelerometerMagnitudeStd
timeBodyAccelerometerJerkMagnitudeStd
timeBodyGyroscopeMagnitudeStd
timeBodyGyroscopeJerkMagnitudeStd
frequencyBodyAccelerometerXaxisStd
frequencyBodyAccelerometerYaxisStd
frequencyBodyAccelerometerZaxisStd
frequencyBodyAccelerometerJerkXaxisStd
frequencyBodyAccelerometerJerkYaxisStd
frequencyBodyAccelerometerJerkZaxisStd
frequencyBodyGyroscopeXaxisStd
frequencyBodyGyroscopeYaxisStd
frequencyBodyGyroscopeZaxisStd
frequencyBodyAccelerometerMagnitudeStd
frequencyBodyBodyAccelerometerJerkMagnitudeStd
frequencyBodyBodyGyroscopeMagnitudeStd
frequencyBodyBodyGyroscopeJerkMagnitudeStd

