# Loading required libraries
library(plyr)

# Load files
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Merges the training and the test sets to create one data set
x_all <- rbind(x_train, x_test)
y_all <- rbind(y_train, y_test)
subject_all <- rbind(subject_train, subject_test)

# Extracts only the measurements on the mean and standard deviation for each measurement
# Grep is used for that
features <- read.table("UCI HAR Dataset/features.txt")
read_min_std_features <- grep("(mean|std)\\(\\)", features[,2])
x_all <- x_all[, read_min_std_features]
names(x_all) <- features[read_min_std_features,2]

# Uses descriptive activity names to name the activities in the data set
activitiy <- read.table("UCI HAR Dataset/activity_labels.txt")
y_all[,1] <- activity[y_all[,1],2]

# Appropriately labels the data set with descriptive variable names
names(y_all) <- "Activity"
names(subject_all) <- "Subject"

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
# The column we need start at 3 and ends in 68
col_start <- 3
col_end <- 68
all <- cbind(subject_all,y_all,x_all)
tidy_data <- ddply(all, .(Subject, Activity), function(x) colMeans(x[, col_start:col_end]))
write.table(tidy_data,file="tidy_data.txt",row.names=FALSE)
