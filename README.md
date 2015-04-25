###Peer Assessment for Getting and Cleaning Data

This repository contains R code to create a tidy dataset from the data offered at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

####Study Design

The 30 subjects were divided into testing and training groups, and the raw data produced was stores as separate text files that gave the subject number, the activity performed, and 561 features measured in the study.

####Analysis

The R code in `run_analysis.R` first loads the data and then merges the training and test data. Then, the features that correspond to either standard deviations or means of measurements are extracted. The data set is further tidied to replace the column names with descriptive labels from the text file that describes the features. The data in the column describing the activities performed was also replaced with a descriptive label rather than a numeric code. Finally, the averages of each feature (variable) for each activity and subject are calculated and output into a text file.

`averages.txt` is the data set produced by `run_analysis.R` that gives the averages of each variable for each activity and subject.

`codebook.md` is a code book that describes the data contained in `averages.txt`.