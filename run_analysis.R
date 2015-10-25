##*************************************************************************************************  
##OBJECTIVE:
##-------------------------------------------------------------------------------------------------
#  The objective of this R Script is to create a tidy data set as required by 
#  "Getting and Cleaning Data Course Project". The requirement is to create 
#     1. Merges the training and the test sets to create one data set.
#     2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#     3. Uses descriptive activity names to name the activities in the data set
#     4. Appropriately labels the data set with descriptive variable names. 
#     5. From the data set in step 4, creates a second, independent tidy data set with the average 
#        of each variable for each activity and each subject.
##*************************************************************************************************  
##DATASET:
##-------------------------------------------------------------------------------------------------
#  The data set for this project was downloaded from the below URL
#     URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
##*************************************************************************************************  
##DEPENDENCIES:
##-------------------------------------------------------------------------------------------------
#  Following are the dependencies to execute this script successfully to create the tidy dataset   
#     1. The script except the dataset mentioned above to be downloaded and uncompressed in the  
#        relative path ./UCI HAR Dataset
#     2. The script assumes that the following packages are installed and already loaded in the env
#        a. dplyr
#        
##*************************************************************************************************  
##MODIFICATION LOG:
##-------------------------------------------------------------------------------------------------
#  VER                          AUTHOR                DATE            REMARKS
#..................................................................................................
#  1.0                          PDASCIENTIST          10/24/15        INITIAL VERSION
#**************************************************************************************************  
#Load the dependent libraries
library(dplyr)

#Unzip the Samsung file which is placed in the working directory
unzip("getdata-projectfiles-UCI HAR Dataset.zip")

#Read the Test Data to the variable testData, testSubject and testLabels
testData <- read.table ("./UCI HAR Dataset/test/X_test.txt")
testSubject <- read.table ("./UCI HAR Dataset/test/subject_test.txt")
testLabels <- read.table ("./UCI HAR Dataset/test/y_test.txt")

#Read the Training Data to the variable trainData, trainSubject and trainLabels
trainData <- read.table ("./UCI HAR Dataset/train/X_train.txt")
trainSubject <- read.table ("./UCI HAR Dataset/train/subject_train.txt")
trainLabels <- read.table ("./UCI HAR Dataset/train/y_train.txt")

#Read the Activity Labels and features in to the variables
activityLabels <- read.table ("./UCI HAR Dataset/activity_labels.txt")
features <- read.table ("./UCI HAR Dataset/features.txt")

##Step 1: Merges the training and the test sets to create one data set
#Merge the Test and Train Data Setsand store it in the mergedData variable and 
#do similar operations for the Subject and Activity 
mergedData <- rbind(testData, trainData)
mergedSubject <- rbind(testSubject, trainSubject)
mergedActvity <- rbind(testLabels, trainLabels)


#Assign the Column Names for the Merged Data Sets and 
#do similar operations for the Subject, Activity  and  activityLabels as well 
names(mergedData) <- features$V2
names(mergedSubject) <- "Subject"
names(mergedActvity) <- "Activity"
names(activityLabels) <- c("Activity", "Activity_Desc")

##Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
#There are many ways to do it. One of them is to using the "select" function in dplyr package 
#as select(mergedData,matches("mean|std")). This method doesn't work though as the col names are not
#unique. For example, "fBodyAcc-bandsEnergy()-1,16" , "fBodyAcc-bandsEnergy()-1,24" ...etc are 
#repeated multiple time. Another method is to use to use the grep function which is used below
#The result is stored in the filteredData variable
filteredData <- mergedData[,grepl("mean|std", colnames(mergedData))]

#Add the Subject and Activity details to the filteredData
filteredData <- cbind(mergedSubject,mergedActvity,filteredData)

##Step 3: Add descriptive Activity names to the dataset. In order to do this,
#filteredData needs to be merged with the activityLabels
tidyData = merge(activityLabels,filteredData,by.x="Activity",by.y="Activity",all=TRUE)

##Step 4: Appropriately labels the data set with descriptive variable names and 
#removing the Activity from data frame
tidyData <- dplyr::select(tidyData,-Activity)

##Step 5: From the tidyData created above, get another independent tidy data set with the average  
#of each variable for each activity and each subject. Done using the summarise_each function 
finalTidyData <- tidyData %>% group_by(Subject,Activity_Desc) %>% summarise_each(funs(mean))

#Write the finalTidyData in to the text file TidyDataset.txt
#TidyDataset.txt will be available in the working directory
write.table(finalTidyData, "TidyDataset.txt",  row.names = FALSE)

#Batch script completed and hence cleaning up the objects
rm(activityLabels, features, filteredData, finalTidyData, mergedActvity, mergedData, 
   mergedSubject, testData, testLabels, testSubject, tidyData, trainData, trainLabels, trainSubject)

## End(Not run)
