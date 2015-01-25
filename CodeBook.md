#CODEBOOK

This is a codebook to help anyone understand how the data set is created.

##FEATURES AND VARIABLES

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ

- tGravityAcc-XYZ

- tBodyAccJerk-XYZ

- tBodyGyro-XYZ

- tBodyGyroJerk-XYZ

- tBodyAccMag

- tGravityAccMag

- tBodyAccJerkMag

- tBodyGyroMag

- tBodyGyroJerkMag

- fBodyAcc-XYZ

- fBodyAccJerk-XYZ

- fBodyGyro-XYZ

- fBodyAccMag

- fBodyAccJerkMag

- fBodyGyroMag

- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value

- std(): Standard deviation

- mad(): Median absolute deviation 

- max(): Largest value in array

- min(): Smallest value in array

- sma(): Signal magnitude area

- energy(): Energy measure. Sum of the squares divided by the number of values. 

- iqr(): Interquartile range 

- entropy(): Signal entropy

- arCoeff(): Autorregresion coefficients with Burg order equal to 4

- correlation(): correlation coefficient between two signals

- maxInds(): index of the frequency component with largest magnitude

- meanFreq(): Weighted average of the frequency components to obtain a mean frequency

- skewness(): skewness of the frequency domain signal 

- kurtosis(): kurtosis of the frequency domain signal 

- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean

- tBodyAccMean

- tBodyAccJerkMean

- tBodyGyroMean

- tBodyGyroJerkMean

##DATA

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

Note: features are normalized and bounded within [-1,1].

##DATA CLEANING-UP

###PART 1: MERGE THE TRAINING AND DATA SETS TO CREATE ONE DATA SET

The first step to work with the data is reading the data from the folder we have the data in, creating separated data sets for training and test data (x,y and subject), features and activities.
Once this has been done, the next step is to bind training and test data into one single data set and naming each column with its corresponding variable name.

###PART 2: EXTRACT THE MEASUREMENTS ON MEAN AND STANDARD DEVIATION

The process to extract the measurements on mean and standard deviation is as follows. In order to identify which columns contains mean or standard deviation values the function "grep" is used, searching for any variable name containing the words "mean" or "std" in any position and using either uppercase or lowercase. Once these columns are identified, a subset containing only those columns is taken.

###PART 3: USE DESCRIPTIVE VARIABLE NAMES TO NAME THE ACTIVITIES ON THE DATA SET

In order to change activities' numbers for its names, each activity name is assigned to its corresponding numerical value, that is, 1-Walking, 2-Walking Upstairs, 3-Walking Downstairs, 4-Sitting, 5-Standing, 6-Laying.

###PART 4: LABEL THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES

According to chapter "Editing text variables" (week 4), names of variables should be all lower case when possible, descriptive (Diagnosis versus Dx), not duplicated and not have underscores or dots or white spaces. Thus, all white spaces, dashes, parenthesis, etc. have been removed using "gsub". Also full names have been added ("Accelerometer" instead of "Acc", "Gyroscope" instead of "Gyro" and so forth).

 [1] "tBodyAccelerometerMeanX"      
 
 
 [2] "tBodyAccelerometerMeanY"                         
 
 [3] "tBodyAccelerometerMeanZ"                         
 
 [4] "tBodyAccelerometerStandardDeviationX"            
 
 [5] "tBodyAccelerometerStandardDeviationY"            
 
 [6] "tBodyAccelerometerStandardDeviationZ"            
 
 [7] "tGravityAccelerometerMeanX"                      
 
 [8] "tGravityAccelerometerMeanY"                      
 
 [9] "tGravityAccelerometerMeanZ"                      

[10] "tGravityAccelerometerStandardDeviationX"         

[11] "tGravityAccelerometerStandardDeviationY"         

[12] "tGravityAccelerometerStandardDeviationZ"         

[13] "tBodyAccelerometerJerkMeanX"                     

[14] "tBodyAccelerometerJerkMeanY"                     

[15] "tBodyAccelerometerJerkMeanZ"                     

[16] "tBodyAccelerometerJerkStandardDeviationX"        

[17] "tBodyAccelerometerJerkStandardDeviationY"        

[18] "tBodyAccelerometerJerkStandardDeviationZ"        

[19] "tBodyGyroscopeMeanX"                             

[20] "tBodyGyroscopeMeanY"                             

[21] "tBodyGyroscopeMeanZ"                             

[22] "tBodyGyroscopeStandardDeviationX"                

[23] "tBodyGyroscopeStandardDeviationY"                

[24] "tBodyGyroscopeStandardDeviationZ"                

[25] "tBodyGyroscopeJerkMeanX"                         

[26] "tBodyGyroscopeJerkMeanY"                         

[27] "tBodyGyroscopeJerkMeanZ"                         

[28] "tBodyGyroscopeJerkStandardDeviationX"            

[29] "tBodyGyroscopeJerkStandardDeviationY"            

[30] "tBodyGyroscopeJerkStandardDeviationZ"            

[31] "tBodyAccelerometerMagnitudeMean"                 

[32] "tBodyAccelerometerMagnitudeStandardDeviation"    

[33] "tGravityAccelerometerMagnitudeMean"              

[34] "tGravityAccelerometerMagnitudeStandardDeviation" 

[35] "tBodyAccelerometerJerkMagnitudeMean"             

[36] "tBodyAccelerometerJerkMagnitudeStandardDeviation"

[37] "tBodyGyroscopeMagnitudeMean"                     

[38] "tBodyGyroscopeMagnitudeStandardDeviation"        

[39] "tBodyGyroscopeJerkMagnitudeMean"                 

[40] "tBodyGyroscopeJerkMagnitudeStandardDeviation"    

[41] "fBodyAccelerometerMeanX"                         

[42] "fBodyAccelerometerMeanY"                         

[43] "fBodyAccelerometerMeanZ"                         

[44] "fBodyAccelerometerStandardDeviationX"            

[45] "fBodyAccelerometerStandardDeviationY"            

[46] "fBodyAccelerometerStandardDeviationZ"            

[47] "fBodyAccelerometerMeanFreqX"                     

[48] "fBodyAccelerometerMeanFreqY"                     

[49] "fBodyAccelerometerMeanFreqZ"                     

[50] "fBodyAccelerometerJerkMeanX"                     

[51] "fBodyAccelerometerJerkMeanY"                     

[52] "fBodyAccelerometerJerkMeanZ"                     

[53] "fBodyAccelerometerJerkStandardDeviationX"        

[54] "fBodyAccelerometerJerkStandardDeviationY"        

[55] "fBodyAccelerometerJerkStandardDeviationZ"        

[56] "fBodyAccelerometerJerkMeanFreqX"                 

[57] "fBodyAccelerometerJerkMeanFreqY"                 

[58] "fBodyAccelerometerJerkMeanFreqZ"                 

[59] "fBodyGyroscopeMeanX"                             

[60] "fBodyGyroscopeMeanY"                             

[61] "fBodyGyroscopeMeanZ"                             

[62] "fBodyGyroscopeStandardDeviationX"                

[63] "fBodyGyroscopeStandardDeviationY"                

[64] "fBodyGyroscopeStandardDeviationZ"                

[65] "fBodyGyroscopeMeanFreqX"                         

[66] "fBodyGyroscopeMeanFreqY"                         

[67] "fBodyGyroscopeMeanFreqZ"                         

[68] "fBodyAccelerometerMagnitudeMean"                 

[69] "fBodyAccelerometerMagnitudeStandardDeviation"    

[70] "fBodyAccelerometerMagnitudeMeanFreq"             

[71] "fBodyAccelerometerJerkMagnitudeMean"             

[72] "fBodyAccelerometerJerkMagnitudeStandardDeviation"

[73] "fBodyAccelerometerJerkMagnitudeMeanFreq"         

[74] "fBodyGyroscopeMagnitudeMean"                     

[75] "fBodyGyroscopeMagnitudeStandardDeviation"        

[76] "fBodyGyroscopeMagnitudeMeanFreq"                 

[77] "fBodyGyroscopeJerkMagnitudeMean"                 

[78] "fBodyGyroscopeJerkMagnitudeStandardDeviation"    

[79] "fBodyGyroscopeJerkMagnitudeMeanFreq"             

[80] "Angle(tBodyAccelerometerMean,Gravity)"           

[81] "Angle(tBodyAccelerometerJerkMean),GravityMean)"  

[82] "Angle(tBodyGyroscopeMean,GravityMean)"           

[83] "Angle(tBodyGyroscopeJerkMean,GravityMean)"       

[84] "Angle(X,GravityMean)"                            

[85] "Angle(Y,GravityMean)"                            

[86] "Angle(Z,GravityMean)"                            

[87] "Activity"                                        

[88] "Subject"  

###PART 5: CREATE AN INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT

First, the data set is sorted by subject and by activity using "group by". Then, the average for each variable is calculated and the data set is summarised using "summarise each".

Finally, the data set is written to a *.txt file using "write.table"

The names of the variables remain the same as in the original data set but the values given in the table correspond to the average value for each variable, subject and activity
