#Load data into R. 
#(The unzipped UCI HAR Dataset is in the working directory.)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

#Bind the columns of the test data.
#Rename subject ID column ("subject_test") and y_test column.
test_data <- cbind(subject_test, y_test, X_test)
names(test_data)[1:2] <- c("ID", "y")

#Bind the columns of the training data.
#Rename the subject ID column and y_test column.
train_data <- cbind(subject_train, y_train, X_train)
names(train_data)[1:2] <- c("ID", "y")

#Merge the datasets by all columns.
data <- merge(test_data, train_data, all=TRUE)

#Find the columns that contain either "mean" or "std".
means <- grep("mean()", features[,2])
stds <- grep("std()", features[,2])

#The columns to be subset will include the first two
#columns, which contain the ID and the activity.
col <- sort(c(means,stds))
columns <- c(1,2,col+2)

#Extract only these columns from the total data.
data <- data[,columns]

#Rename the activities in column "y" with the activity labels.
vector <- data$y
activity <- activity_labels$V2[vector]
data[,2] <- activity
names(data)[2] <- "activity"

#Label data with descriptive variable names
#(using the labels given in "features").
feature_labels <- features[col,2]
names(data)[3:81] <- as.character(feature_labels)

#Create a new data set that has the averages
#of each activity for each activity and subject.
#Output the results to a text file.
output <- with(data, aggregate(as.matrix(data[,3:81]) ~ ID+activity, FUN="mean"))
write.table(output, file="averages.txt", row.name=FALSE)