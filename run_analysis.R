
###############################################################################
# Load the libraries used.
###############################################################################

library(reshape2)
library(dplyr)

###############################################################################
# Load the common data.
###############################################################################

# Load the activity labels.
# This is a look-up table mapping activity numbers to descriptive labels.
actvty_lbls <- read.table("UCI HAR Dataset\\activity_labels.txt")
names(actvty_lbls) <- c("activity_id","activity_name")

# Read in the "features" file, which has the measurement names; i.e.,
# the names of the columns in the test and training datasets.
feat <- read.table("UCI HAR Dataset\\features.txt")
names(feat) <- c("column_number","column_name")

###############################################################################
# Process the testing data.
###############################################################################

# Read in the activity label IDs for the testing dataset.
# *** TESTING: Limit to the first 10 records for faster processing.
# test_lbl_ids <- read.table("test\\y_test.txt",nrows=10)
test_lbl_ids <- read.table("UCI HAR Dataset\\test\\y_test.txt")
names(test_lbl_ids) <- c("activity_id")
test_lbl_cnt <- nrow(test_lbl_ids)
test_lbl_ids$row_id <- seq(1:test_lbl_cnt)

# Add the activity-names to the labels.
test_lbls <- merge(test_lbl_ids, actvty_lbls, by="activity_id", sort=FALSE, all=FALSE)

# Read in the subject IDs for the testing dataset.
# *** TESTING: Limit to the first 10 records for faster processing.
# test_subj <- read.table("test\\subject_test.txt",nrows=10)
test_subj <- read.table("UCI HAR Dataset\\test\\subject_test.txt")
names(test_subj) <- c("subject_id")
test_subj_cnt <- nrow(test_subj)
test_subj$row_id <- seq(1:test_subj_cnt)

# Combine the test activity labels and the subject_ids
test_dims <- merge(test_lbls, test_subj, by="row_id", sort=TRUE, all=TRUE)

# Read in the testing measurement dataset.
# *** TESTING: Limit to the first 10 records for faster processing.
# test_meas <- read.table("test\\X_test.txt",nrows=10)
test_meas <- read.table("UCI HAR Dataset\\test\\X_test.txt")
names(test_meas) <- feat$column_name
test_meas_cnt <- nrow(test_meas)
test_meas$row_id <- seq(1:test_meas_cnt)

# Combine the testing activity labels and the measurements.
test_dat <- merge(test_dims, test_meas, by="row_id", sort=TRUE, all=TRUE)

# Normalize the data into one row per measurement.
test_melt <- melt( test_dat, id=c("row_id","activity_id","activity_name","subject_id"),measure.vars=feat$column_name)

# Select only the rows that contain "mean" or "std" measurements.
# Combine the two rowsets back into one dataframe.
test_subset <- rbind(
  test_melt[grep("mean()",test_melt$variable),]
  ,test_melt[grep("std()",test_melt$variable),]
)

# Denormalize the data back into one record per row_id.
# test_denorm <- dcast(test_subset, row_id + activity_id + activity_name + subject_id ~ variable )


###############################################################################
# Process the training data.
###############################################################################

# Read in the activity label IDs for the training dataset.
train_lbl_ids <- read.table("UCI HAR Dataset\\train\\y_train.txt")
# *** TESTING: Limit to the first 10 records for faster processing.
# train_lbl_ids <- read.table("train\\y_train.txt",nrows=10)
names(train_lbl_ids) <- c("activity_id")
train_lbl_cnt <- nrow(train_lbl_ids)
train_lbl_ids$row_id <- seq(1:train_lbl_cnt)

# Add the activity-names to the labels.
train_lbls <- merge(train_lbl_ids, actvty_lbls, by="activity_id", sort=FALSE, all=FALSE)

# Read in the subject IDs for the training dataset.
train_subj <- read.table("UCI HAR Dataset\\train\\subject_train.txt")
# *** TESTING: Limit to the first 10 records for faster processing.
# train_subj <- read.table("train\\subject_train.txt",nrows=10)
names(train_subj) <- c("subject_id")
train_subj_cnt <- nrow(train_subj)
train_subj$row_id <- seq(1:train_subj_cnt)

# Combine the train activity labels and the subject_ids
train_dims <- merge(train_lbls, train_subj, by="row_id", sort=TRUE, all=TRUE)

# Read in the training measurement dataset.
train_meas <- read.table("UCI HAR Dataset\\train\\X_train.txt")
# *** TESTING: Limit to the first 10 records for faster processing.
# train_meas <- read.table("train\\X_train.txt",nrows=10)
names(train_meas) <- feat$column_name
train_meas_cnt <- nrow(train_meas)
train_meas$row_id <- seq(1:train_meas_cnt)

# Combine the training activity labels and the measurements.
train_dat <- merge(train_dims, train_meas, by="row_id", sort=TRUE, all=TRUE)

# Normalize the data into one row per measurement.
train_melt <- melt( train_dat, id=c("row_id","activity_id","activity_name","subject_id"),measure.vars=feat$column_name)

# Select only the rows that contain "mean" or "std" measurements.
# Combine the two rowsets back into one dataframe.
train_subset <- rbind(
  train_melt[grep("mean()",train_melt$variable),]
  ,train_melt[grep("std()",train_melt$variable),]
)

# Denormalize the data back into one record per row_id.
# train_denorm <- dcast(train_subset, row_id + activity_id + activity_name + subject_id ~ variable )


###############################################################################
# Combine the two datasets.
###############################################################################

# Combine the two datasets.
combined_norm_dataset <- rbind(test_subset, train_subset)

# Denormalize the combined dataset.
# This restores it to the format of the original datasets.
# Remove the row_id column, which is not needed and will have duplicates
# from the two datasets.
combined_dataset_unsorted <- dcast(combined_norm_dataset, row_id + activity_id + activity_name + subject_id ~ variable )
combined_dataset_unsorted$row_id <- NULL

# Sort the combined dataset by activity and subject.
combined_dataset <- arrange( combined_dataset_unsorted, activity_id, subject_id )

# Create a combined dataset that has averaged values in the columns.
# This operation seems to implicitly sort the data by the grouping columns.
combined_avg_dataset <- dcast(combined_norm_dataset, activity_id + activity_name + subject_id ~ variable, mean )

# Add "-avg" to all the measurement names in the averages dataset.
# This takes advantage of the fact that all measurement names begin with
# a 't' or 'f', and the non-measurement names do not.
names(combined_avg_dataset) <- sub("^((f|t).*)$","\\1-avg",names(combined_avg_dataset))

###############################################################################
# Write out the dataset of averages.
###############################################################################
write.csv(combined_avg_dataset, file="UCI HAR Dataset Avg.csv", row.names=FALSE )
