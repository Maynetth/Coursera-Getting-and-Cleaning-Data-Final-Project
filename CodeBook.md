The run_analysis.R script was used to prepare and structure the messy data by following the five steps outline in the project instruction.
1. Download the Dataset:
The data set of relavance to his was downloaded and extracted from a zip folder called UCI HAR Dataset
2. Assigning the data to the variables:
features <- features.txt: 561 rows, 2 columns
activities <- activity_lables.txt: 6 rows, 2 columns
subject_test <- test/subject_test.txt: 2947 rows, 1 column
x_test <- test/X_test.txt: 2947 rows, 561 columns
y_test <- test/y_test.txt: 2947 rows, 1 column
subject_train <- test/subject_train.txt : 7352 rows, 1 column
x_train <- test/X_train.txt : 7352 rows, 561 columns
y_train <- test/y_train.txt : 7352 rows, 1 columns
3. Merging the training and test sets into one data set
X was created by using the rbind() function on x_train and x_test: 10299 rows, 561 columns
Y was created by using the rbind() function on y_train and y_test: 10299 rows, 1 column
Subject was created by using the rbind() function on subject_train and subject_test: 10299 rows, 1 column
Merged_Data was created using a cbind() function on Subject, X, and Y: 10299 rows, 563 column
3.Extract only the mean and standard deviation:
grep was used to search for mean and standard deviation
gsub was used to replace all the elements except mean and standard deviation
This was assigned to selectedData.names
4. label the data sets
allData stemmed from the assignment of a vector of the strings "subject" and "activity" plus the selectedData.names
factors were created for the activity and the subject, with the subject being expressed as a factor due to as.
meltedData stemmed from assigning the melt() function to allData and an id = id = c("Subject","Activity")
tidyData was an assignment of our dcast function including our melteddata plus other variables
5. Create a tidy data set
tidy_dataset.txt stemmed from the write.table() function that included the tidyData assignmetn from the previous step plus a string

Here is a list of all the remaining variables:
Subject Activity tBodyAccMeanX tBodyAccMeanY tBodyAccMeanZ tBodyAccStdX tBodyAccStdY tBodyAccStdZ tGravityAccMeanX tGravityAccMeanY tGravityAccMeanZ tGravityAccStdX tGravityAccStdY tGravityAccStdZ tBodyAccJerkMeanX tBodyAccJerkMeanY tBodyAccJerkMeanZ tBodyAccJerkStdX tBodyAccJerkStdY tBodyAccJerkStdZ tBodyGyroMeanX tBodyGyroMeanY tBodyGyroMeanZ tBodyGyroStdX tBodyGyroStdY tBodyGyroStdZ tBodyGyroJerkMeanX tBodyGyroJerkMeanY tBodyGyroJerkMeanZ tBodyGyroJerkStdX tBodyGyroJerkStdY tBodyGyroJerkStdZ tBodyAccMagMean tBodyAccMagStd tGravityAccMagMean tGravityAccMagStd tBodyAccJerkMagMean tBodyAccJerkMagStd tBodyGyroMagMean tBodyGyroMagStd tBodyGyroJerkMagMean tBodyGyroJerkMagStd fBodyAccMeanX fBodyAccMeanY fBodyAccMeanZ fBodyAccStdX fBodyAccStdY fBodyAccStdZ fBodyAccMeanFreqX fBodyAccMeanFreqY fBodyAccMeanFreqZ fBodyAccJerkMeanX fBodyAccJerkMeanY fBodyAccJerkMeanZ fBodyAccJerkStdX fBodyAccJerkStdY fBodyAccJerkStdZ fBodyAccJerkMeanFreqX fBodyAccJerkMeanFreqY fBodyAccJerkMeanFreqZ fBodyGyroMeanX fBodyGyroMeanY fBodyGyroMeanZ fBodyGyroStdX fBodyGyroStdY fBodyGyroStdZ fBodyGyroMeanFreqX fBodyGyroMeanFreqY fBodyGyroMeanFreqZ fBodyAccMagMean fBodyAccMagStd fBodyAccMagMeanFreq fBodyBodyAccJerkMagMean fBodyBodyAccJerkMagStd fBodyBodyAccJerkMagMeanFreq fBodyBodyGyroMagMean fBodyBodyGyroMagStd fBodyBodyGyroMagMeanFreq fBodyBodyGyroJerkMagMean fBodyBodyGyroJerkMagStd fBodyBodyGyroJerkMagMeanFreq
