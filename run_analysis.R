# Set the working directory where the data is stored
setwd("C:/Users/Nacho/Desktop/Johns Hopkins Data Science")

# Call dplyr 
library(dplyr)

# PART 1: MERGE THE TRAINING AND DATA SETS TO CREATE ONE DATA SET

# Read train, test, features and activity data
xtrain<-read.table("UCI HAR Dataset/train/X_train.txt")
xtest<-read.table("UCI HAR Dataset/test/X_test.txt")
ytrain<-read.table("UCI HAR Dataset/train/y_train.txt")
ytest<-read.table("UCI HAR Dataset/test/y_test.txt")
subjecttrain<-read.table("UCI HAR Dataset/train/subject_train.txt")
subjecttest<-read.table("UCI HAR Dataset/test/subject_test.txt")
features<-read.table("UCI HAR Dataset/features.txt")
activity<-read.table("UCI HAR Dataset/activity_labels.txt")

# Bind the different data sets
x<-rbind(xtrain,xtest) 
y<-rbind(ytrain,ytest)
subject<-rbind(subjecttrain,subjecttest)

# Name the columns of each data set
colnames(x)<-features[,2]
colnames(y)<-"Activity"
colnames(subject)<-"Subject"

# PART 2: EXTRACT THE MEASUREMENTS ON MEAN AND STANDARD DEVIATION

#Search which columns include mean or std in its name
columns_mean_std<-grep("mean|std|Mean",colnames(x))

#Take those columns for our data set
x<-x[,columns_mean_std] 

# PART 3: USE DESCRIPTIVE VARIABLE NAMES TO NAME THE ACTIVITIES ON THE DATA SET

y[y==1]="Walking"
y[y==2]="WalkingUpstairs"
y[y==3]="WalkingDownstairs"
y[y==4]="Sitting"
y[y==5]="Standing"
y[y==6]="Laying"       

# PART 4: LABEL THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES

# Bind x,y and subject to create the whole data set
data<-cbind(x,y,subject)

# Label the data set with descriptive variable names according week 4 including
# whole names and removing white spaces, dashes, parenthesis and so forth
colnames(data)<-gsub("()","",colnames(data),fixed=TRUE)
colnames(data)<-gsub("-","",colnames(data),fixed=TRUE)
colnames(data)<-gsub("Acc","Accelerometer",colnames(data),fixed=TRUE)
colnames(data)<-gsub("Gyro","Gyroscope",colnames(data),fixed=TRUE)
colnames(data)<-gsub("Jerk","Jerk",colnames(data),fixed=TRUE)
colnames(data)<-gsub("Mag","Magnitude",colnames(data),fixed=TRUE)
colnames(data)<-gsub("gravity","Gravity",colnames(data),fixed=TRUE)
colnames(data)<-gsub("Mean","Mean",colnames(data),fixed=TRUE)
colnames(data)<-gsub("mean","Mean",colnames(data),fixed=TRUE)
colnames(data)<-gsub("std","StandardDeviation",colnames(data),fixed=TRUE)
colnames(data)<-gsub("angle","Angle",colnames(data),fixed=TRUE)
colnames(data)<-gsub("BodyBody","Body",colnames(data),fixed=TRUE)

# PART 5: CREATE AN INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT

# Tidy the data by subject and by activity
tidy<-group_by(data,Subject,Activity)

# Calculate the mean for each variable and summarise the data set
tidy<-summarise_each(tidy,funs(mean))

# Write the data into a *.txt file
write.table(tidy,file="TidyData.txt",row.names=FALSE)
