
#all the data files are assumet to be downloaded and unzipped in UCI HAR Dataset folder
#the working directory is assumed to be .../UCI HAR Dataset


library(dplyr)
#reading the files
x_train <- read.table("train/X_train.txt", sep="", strip.white=T, stringsAsFactors=F)#train measurements
x_test <- read.table("test/X_test.txt", sep="", strip.white=T, stringsAsFactors=F)#test measurements

subject_train <- read.table("train/subject_train.txt", sep="\n", stringsAsFactors=F)#subjects in train set
subject_test <- read.table("test/subject_test.txt", sep="\n", stringsAsFactors=F)#subjects in test set

activity_train <- read.table("train/Y_train.txt", sep="\n", stringsAsFactors=F)#activity in train set
activity_test <- read.table("test/Y_test.txt", sep="\n", stringsAsFactors=F)#activity in test set
features <- read.table("features.txt", sep=" ", stringsAsFactors=F)#names of the measurements
activities <- read.table("activity_labels.txt", sep=" ")#names of the activities

#adding the names to the tain and test datasets
names(x_train) <- features[,2]
names(x_test) <- features[,2]

#adding the subject and activity to the train and test dataset
x_train$Subject <- subject_train[,1]
x_train$Activity <-activity_train[,1]
x_test$Subject <- subject_test[,1]
x_test$Activity <-activity_test[,1]



#merging the train and test datasets
full_dataset <- rbind(x_train, x_test)

mean_dataset <- full_dataset[,grep("mean",names(full_dataset))]#selecting the columns containing the string mean 
mean_dataset <- mean_dataset[,-grep("meanFreq",names(mean_dataset))]#excluding the column containing the string meanFreq
std_dataset <- full_dataset[,grep("std",names(full_dataset))]#selecting the columns containing the string std

#merging the mean and std datasets and adding subject and activity
mean.std.dataset <- cbind(mean_dataset,std_dataset)
mean.std.dataset$Subject <- full_dataset$Subject
mean.std.dataset$Activity <- full_dataset$Activity

#matching the values 1:6 in column Activity with column 1 of dataset activities and 
#replacing them with descriptive value from column 2 of dataset activities
mean.std.dataset$Activity <- activities[match(mean.std.dataset$Activity, activities[,1]), 2]

#fixing the variables name, removing the special characters and making them more descriptive
names <- names(mean.std.dataset)
names <-gsub("-","",names)#removing -
names <-gsub("[[:punct:]]","",names)#removing ()
names <-gsub("mean","Mean",names)
names <-gsub("std","Std",names)
names <-gsub("MeanX","XaxisMean",names)
names <-gsub("MeanY","YaxisMean",names)
names <-gsub("MeanZ","ZaxisMean",names)
names <-gsub("StdX","XaxisStd",names)
names <-gsub("StdY","YaxisStd",names)
names <-gsub("StdZ","ZaxisStd",names)
names <-gsub("tBody","timeBody",names)
names <-gsub("tGravity","timeGravity",names)
names <-gsub("fBody","frequencyBody",names)
names <-gsub("fGravity","frequencyGravity",names)
names <-gsub("Mag","Magnitude",names)
names <-gsub("Acc","Accelerometer",names)
names <-gsub("Gyro","Gyroscope",names)
names <-gsub("StdX","XaxisStd",names)
names <-gsub("BodyBody","Body",names)
names(mean.std.dataset) <- names

#moving subject and activity column in front
mean.std.dataset <- mean.std.dataset[ ,c(67,68,1:66)]

#grouping by subject and activity and applying the mean function to the rest of the variables
mean.subject.activity <- mean.std.dataset%>%group_by(Subject,Activity)%>%summarise_each(funs(mean))
write.table(mean.subject.activity,file="mean_subject_activity.txt", quote=F, row.names=F)       

