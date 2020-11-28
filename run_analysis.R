# prepare library
library(reshape2)
library(dplyr)

# Get Data and create files
filename <- "Courseera_DS3_Final.zip"

if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  

if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

#Load the Data sets and assign them to varibles
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
s_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
s_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")


# This is merging the training and test data sets to one set
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(s_train, s_test)
Merged_Data <- cbind(Subject, Y, X)

#Extracting only the mean and the standard deviation
selectedData <- grep(".*mean.*|.*std.*", features[,2])
selectedData.names <- features[selectedData,2]
selectedData.names = gsub('-mean', 'Mean', selectedData.names)
selectedData.names = gsub('-std', 'Std', selectedData.names)
selectedData.names <- gsub("[-()]","",selectedData.names)

# Extract data by using descriptive names
X <- X[selectedData]
allData <- cbind(Subject,Y,X)
colnames(allData) <- c("Subject","Activity", selectedData.names)

allData$Activity <- factor(allData$Activity, levels = activities[,1], labels = activities[,2])
allData$Subject <- as.factor(allData$Subject)

# generate tidy data set
meltedData <- melt(allData, id = c("Subject","Activity"))
tidyData <- dcast(meltedData, Subject + Activity ~ variable, mean)

write.table(tidyData, "./tidy_dataset.txt", row.names = FALSE, quote = FALSE)