###Peer Assessment for Getting and Cleaning Data

####Code Book

`averages.txt` is a tidy data set that contains 81 columns and 180 rows describing the means and the standard deviations for a variety of features averaged for each subject in the study performing each activity.

The first column is labeled "ID" and contains the number identifying the subject. There were 30 subjects, and the "ID" numbers range from 1 to 30.

The second column is labeled "Activity" and gives the activity that the subject was performing. There were six activities: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, and WALKING_UPSTAIRS.

The remaining columns (columns 3 through 81) are labeled as the mean or standard deviation in each sample window for various features reported in the UCI HAR dataset. (The file included in the data set titled 'features_info.txt' gives the physical meaning of each of the features.) The means and standard deviations for each feature were averaged over the signal window samples for each subject performing each activity, and these are the values that are reported in this data set.