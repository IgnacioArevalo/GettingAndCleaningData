# Getting And Cleaning Data Course Project

##DATA CLEANING-UP

PART 1: MERGE THE TRAINING AND DATA SETS TO CREATE ONE DATA SET

The first step to work with the data is reading the data from the folder we have the data in, creating separated data sets for training and test data (x,y and subject), features and activities.
Once this has been done, the next step is to bind training and test data into one single data set and naming each column with its corresponding variable name.

PART 2: EXTRACT THE MEASUREMENTS ON MEAN AND STANDARD DEVIATION

The process to extract the measurements on mean and standard deviation is as follows. In order to identify which columns contains mean or standard deviation values the function "grep" is used, searching for any variable name containing the words "mean" or "std" in any position and using either uppercase or lowercase. Once these columns are identified, a subset containing only those columns is taken.

PART 3: USE DESCRIPTIVE VARIABLE NAMES TO NAME THE ACTIVITIES ON THE DATA SET

In order to change activities' numbers for its names, each activity name is assigned to its corresponding numerical value, that is, 1-Walking, 2-Walking Upstairs, 3-Walking Downstairs, 4-Sitting, 5-Standing, 6-Laying.

PART 4: LABEL THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES

According to chapter "Editing text variables" (week 4), names of variables should be all lower case when possible, descriptive (Diagnosis versus Dx), not duplicated and not have underscores or dots or white spaces. Thus, all whites spaces, dashes, parenthesis, etc. have been removed using "gsub". Also full names have been added ("Accelerometer" instead of "Acc", "Gyroscope" instead of "Gyro" and so forth).

PART 5: CREATE AN INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT

First, the data set is sorted by subject and by activity using "group by". Then, the average for each variable is calculated and the data set is summarised using "summarise each".

Finally, the data set is written to a txt.file using "write.table"

The values given in the table correspond to the average value for each variable, subject and activity
