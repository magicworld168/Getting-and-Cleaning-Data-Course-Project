install.packages("data.table")
library("data.table")

##1. Merges the training and the test sets to create one data set.
##Read Fearures files
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",header = FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",header = FALSE)

##Read the Activity files
X_training <- read.table("./UCI HAR Dataset/train/X_train.txt",header = FALSE)
y_training <- read.table("./UCI HAR Dataset/train/y_train.txt",header = FALSE)

##Read the Subject files
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",header = FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",header = FALSE)


##Merges the training and test data sets
dataSubject <- rbind(subject_train, subject_test)
dataActivity<- rbind(y_test, y_training)
dataFeatures<- rbind(X_test, X_training)

##Assing header
names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
featuresNames <- read.table("./UCI HAR Dataset/features.txt",head=FALSE)[,2]
names(dataFeatures)<- featuresNames


data2 <- cbind(dataSubject, dataActivity)
dataAll <- cbind(dataFeatures, data2)

##2. Extract only the measurements on the mean and SD for each measurments
dataFeatures2 <- dataFeatures[,grep("mean\\(\\)|std\\(\\)", names(dataFeatures), value=TRUE)]
dataFeatures3 <- cbind(dataFeatures2,dataSubject)
dataFeatures4 <- cbind(dataFeatures3,dataActivity)

##3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",header = FALSE)
names(activity_labels)<- c("activityID","activityDesc")
dataFeatures4$activity <- factor(dataFeatures4$activity,levels=activity_labels$activityID,labels=activity_labels$activityDesc)


##4. Appropriately labels the data set with descriptive variable names.
dataFeatures5 <- dataFeatures4
names(dataFeatures5)<- gsub("^t", "Time",names(dataFeatures5))
names(dataFeatures5)<- gsub("^f", "Frequency",names(dataFeatures5))
names(dataFeatures5)<- gsub("Acc", "Accelerometer",names(dataFeatures5))
names(dataFeatures5)<- gsub("Gyro", "Gyroscope",names(dataFeatures5)) 
names(dataFeatures5)<- gsub("Mag", "Magnitude",names(dataFeatures5)) 
names(dataFeatures5)

##5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
meanByActSub <-aggregate(dataFeatures6, by=list(dataFeatures5$subject,dataFeatures5$activity), 
                    FUN=mean, na.rm=TRUE)

  ##output the file to table
write.table(meanByActSub,file="./Tidy Data.csv",sep=",",row.names = FALSE)

