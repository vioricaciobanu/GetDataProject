# GetDataProject
The project for Getting and Cleaning Data Course

The raw datasets are included in a new brach Raw_Data. 
There is a README.txt file explaining the experiment and features_info.txt file explaining what each of the 561 measurements is representing.

The script run_analysis.R assumes the working directory is .../UCI HAR Dataset folder with all the raw datsets unzipped

It assumes the package dplyr is installed.

The script is: 
1. merging the training and test datasets and adding subject and activity.
2. extracting the variables containg the mean or standard deviation of the measurements
3. fixing the variables' names, removing the special characters and making them more descriptive.
4. making a new tidy dataset containing the averages of each meausurement from step 3 grouped by subject and activity   

The output of the script is the tidy dataset mean.subject.activity.txt (it requires Notepad+ to read it properly on Window) 
which is included in this repository
