#GETTING AND CLEANING DATA COURSE PROJECT

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
