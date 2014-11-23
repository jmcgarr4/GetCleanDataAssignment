
# Import training set and bind columns to create a train dataframe
train_data <- read.table("UCI HAR Dataset/train/x_train.txt")
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(train_subject,train_labels,train_data)

# Import test set and bind colums to create a test dataframe
test_data <- read.table("UCI HAR Dataset/test/x_test.txt")
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(test_subject,test_labels,test_data)

# Combine train and test to create one large dataframe
data <- rbind(train,test)

# Import feature names, and use them to label the columns of the data
features <- read.table("UCI HAR Dataset/features.txt")
features <- as.character(features[,2])
features <- c("Subject","Activity",features)
colnames(data) <- features

# Determine which variable names contain references to "mean" or "std" and remove the rest
msd <- c(1,2,grep("mean|std", features))
data_msd <- data[,msd]

# Give descriptive names to the activites
act <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
# Using a temporary vector to get past class issues when directly replacing the items in the df
temp <- data_msd[,2]
for (i in 1:length(temp)) {temp[i] <- act[data_msd[i,2]]}
data_msd[,2] <- temp

# Clean up the variable names and make them more descriptive
names <- colnames(data_msd)
names <- make.names(names)
for (i in 1:length(names)){
    names[i] <- gsub("...","",names[i],fixed=TRUE)
    names[i] <- gsub("..","",names[i],fixed=TRUE)
    names[i] <- gsub("tB","TimeB",names[i],fixed=TRUE)
    names[i] <- gsub("tG","TimeG",names[i],fixed=TRUE)
    names[i] <- gsub("fB","FrequencyB",names[i],fixed=TRUE)
    names[i] <- gsub("fG","FrequencyG",names[i],fixed=TRUE)
    names[i] <- gsub("BodyBody","Body",names[i],fixed=TRUE)
    names[i] <- gsub(".mean","Mean",names[i],fixed=TRUE)
    names[i] <- gsub(".std","StDev",names[i],fixed=TRUE)
}
colnames(data_msd) <- names

# Create separate, tidy data set with average of each signal by subject & activity
tidy_data <- data_msd %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))

write.table(tidy_data, file = "tidy_data_mcgarr.txt", row.names=FALSE)

