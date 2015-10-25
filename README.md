## Project Description
The objective of this project ("Getting and Cleaning Data Course Project"), is to create a tidy data set from the Samsung data set 
as per the below requirements. 
   1. Merges the training and the test sets to create one data set.
   2. Extracts only the measurements on the mean and standard deviation for each measurement. 
   3. Uses descriptive activity names to name the activities in the data set
   4. Appropriately labels the data set with descriptive variable names. 
   5. From the data set in step 4, creates a second, independent tidy data set with the average 
      of each variable for each activity and each subject.

## The dataset includes the following files:
- README.md			: 	This file
- run_analysis.R	: 	The script used to generate the tidy data set as per the requirements listed above from the source data 
						obatained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip which was a subset of 
						the data available in UCI Machine Learning Repository. A full description is available at the site where the original data was obtained: 
						http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
- Code_Book.md 		:	Code book for the "TidyDataset.txt" which contains the tidy data set as per the project requirements
- TidyDataset.txt	:	Tidy data set file   

##Creating the tidy datafile

###Guide to create the tidy data file
The Tidy data set as per the project requirements can be created by the following steps
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

##Notes: 

For more information about this dataset contact: praveen-da-scientist.   
If any questions on the original raw data set, please contact activityrecognition@smartlab.ws

##License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1]    
   

      
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
