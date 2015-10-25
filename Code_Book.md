## Project Description
The objective of this project ("Getting and Cleaning Data Course Project"), is to create a tidy data set from the Samsung data set 
as per the below requirements. 
   1. Merges the training and the test sets to create one data set.
   2. Extracts only the measurements on the mean and standard deviation for each measurement. 
   3. Uses descriptive activity names to name the activities in the data set
   4. Appropriately labels the data set with descriptive variable names. 
   5. From the data set in step 4, creates a second, independent tidy data set with the average 
      of each variable for each activity and each subject.

##Study design and data processing
One of the most exciting areas in all of data science right now is wearable computing. 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
The raw data was collected from the accelerometers from the Samsung Galaxy S smartphone and the sensor signals (accelerometer and gyroscope) were pre-processed.
A full description is available at the site where the data was obtained: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Collection of the raw data
The data for this project was obatained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip which was a subset of 
the data available in UCI Machine Learning Repository. A full description is available at the site where the original data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Notes on the original (raw) data 
A full description is available at the site where the original data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Creating the tidy datafile

###Guide to create the tidy data file
The Tidy data set as per the project requirements can be created by the following steps: 
   1. Download the data set manually from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and place it in the working 
      directory where "run_analysis.R" file will be placed
   2. Make sure that the "dplyr" package is installed in the R environment which is used in the "run_analysis.R"
   3. Execute the "run_analysis.R" file which will unzip the downloaded zip file and will create the tidy data set in the working directory with the name
	  as "TidyDataset.txt"

###Cleaning of the data
The data cleaning is done following a Nine step process which is detailed below: 
   1. Unzip the data source file
   2. Read the Test Data and Training Data files along with the Activity Labels and Features
   3. Combine the training and test data files
   4. Populate the column names for the merged data sets
   5. Filter only the mean and std deviation columns (only the columns which contains mean or std in their names were extracted) 
	  and get it in to a new data frame called filteredData
   6. Add descriptive Activity names and Subject as well to the data set
   7. Create the independent tidy data set with the average of each variable for each activity and each subject
   8. Write the tidy data set to a text file using the write.table function
   9. As the final step, remove the temporary variables from the environment to free up the memory
	
##Description of the variables in the "TidyDataset.txt" file
General description of the file are given below:
 - TidyDataset.txt contains 35 observations and 81 variables
 - Variables present in the tidy data set file, their class and the sample values are given below,
    - Subject:
      Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30                        
      Class: int
    - Activity_Desc                  
      Links the class labels with their activity name. It is a Factor w/ 6 levels such as "LAYING","SITTING","STANDING","WALKING", "WALKING_DOWNSTAIRS" and "WALKING_UPSTAIRS"   
      Class: Factor
    - Measures:
      Data set contains the mean() and standard deviation for the following variables in XYZ axes as applicable   
      - '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.   
         tBodyAcc-XYZ   
         tGravityAcc-XYZ   
         tBodyAccJerk-XYZ   
         tBodyGyro-XYZ   
         tBodyGyroJerk-XYZ   
         tBodyAccMag   
         tGravityAccMag   
         tBodyAccJerkMag   
         tBodyGyroMag   
         tBodyGyroJerkMag   
         fBodyAcc-XYZ   
         fBodyAccJerk-XYZ   
         fBodyGyro-XYZ   
         fBodyAccMag   
         fBodyAccJerkMag   
         fBodyGyroMag   
         fBodyGyroJerkMag   
   Class: Numeric