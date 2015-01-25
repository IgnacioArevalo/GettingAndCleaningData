# Getting And Cleaning Data Course Project

# The following script allows the user to extract, clean and tidy the required data

library(dplyr)
library(tidyr)

# Set the working directory 
setwd("C:/Users/Nacho/Desktop/Johns Hopkins Data Science")

# Read train, test, features and activity data
xtrain<-read.table("UCI HAR Dataset/train/X_train.txt")
xtest<-read.table("UCI HAR Dataset/test/X_test.txt")
ytrain<-read.table("UCI HAR Dataset/train/y_train.txt")
ytest<-read.table("UCI HAR Dataset/test/y_test.txt")
subjecttrain<-read.table("UCI HAR Dataset/train/subject_train.txt")
subjecttest<-read.table("UCI HAR Dataset/test/subject_test.txt")
features<-read.table("UCI HAR Dataset/features.txt")
activity<-read.table("UCI HAR Dataset/activity_labels.txt")

# PART 1: MERGE THE TRAINING AND DATA SETS TO CREATE ONE DATA SET
x<-rbind(xtrain,xtest) 
colnames(x)<-features[,2]
y<-rbind(ytrain,ytest)
colnames(y)<-"Activity"
subject<-rbind(subjecttrain,subjecttest)
colnames(subject)<-"Subject"

# PART 2: EXTRACT THE MEASURAMENTS ON MEAN AND STANDARD DEVIATION

# Extract data for mean and std
columns_mean_std<-grep("mean|std|Mean",colnames(x))
x<-x[,columns_mean_std]

# PART 3: USE DESCRIPTIVE VARIABLE NAMES TO NAME THE ACTIVITIES ON THE DATA SET
y[y==1]="Walking"
y[y==2]="Walking Upstairs"
y[y==3]="Walking downstairs"
y[y==4]="Sitting"
y[y==5]="Standing"
y[y==6]="Laying"       

# PART 4: LABEL THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES

data<-cbind(x,y,subject)
colnames(data)<-gsub("()","",colnames(data),fixed=TRUE)
colnames(data)<-gsub("-"," ",colnames(data),fixed=TRUE)
colnames(data)<-gsub("Acc"," Accelerometer",colnames(data),fixed=TRUE)
colnames(data)<-gsub("Gyro"," Gyroscope",colnames(data),fixed=TRUE)
colnames(data)<-gsub("Jerk"," Jerk",colnames(data),fixed=TRUE)
colnames(data)<-gsub("Mag"," Magnitude",colnames(data),fixed=TRUE)
colnames(data)<-gsub("gravity","Gravity ",colnames(data),fixed=TRUE)
colnames(data)<-gsub("Mean"," Mean",colnames(data),fixed=TRUE)
colnames(data)<-gsub("mean"," Mean",colnames(data),fixed=TRUE)
colnames(data)<-gsub("std"," Standard Deviation",colnames(data),fixed=TRUE)
colnames(data)<-gsub("angle","Angle ",colnames(data),fixed=TRUE)
colnames(data)<-gsub("BodyBody","Body",colnames(data),fixed=TRUE)
colnames(data)<-gsub("MeanFreq","Mean Freq",colnames(data),fixed=TRUE)
colnames(data)<-gsub("tGravity","t Gravity ",colnames(data),fixed=TRUE)
colnames(data)<-gsub("tBody","t Body",colnames(data),fixed=TRUE)
colnames(data)<-gsub("fBody","f Body",colnames(data),fixed=TRUE)

# PART 5: CREATE AN INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE
#         FOR EACH ACTIVITY AND EACH SUBJECT
tidy<-group_by(data,Subject,Activity)
tidy<-summarise_each(tidy,funs(mean))
write.table(tidy,file="TidyData.txt",row.names=FALSE)
