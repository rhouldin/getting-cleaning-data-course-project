# UCI HAR Dataset Avg dataset

## Description

Course project for Coursera "Getting and Cleaning Data" course.

This dataset is a condensation of the UCI HAR dataset (referred to below
as "the original data"), derived as follows:

- The test and training datasets in the original data have been combined.

- The subject-ID, activity-ID and activity-name are contained in separate
files in the original data.  In this dataset, they are combined with the
corresponding measurement data and are present in the first three columns.

- Only the MEAN and STD measurements are retained.  These consist of the
columns in the original data whose names contain the strings "mean()" and
"std()", respectively.

- The data has been summarized so that there is one record per subject, per
activity.  The multiple measurement records in the original data have been
averaged over the subject and activity.  The string "-avg" has been appended
to the original measurement names to reflect this.

## Contents

README.md                   This file.
UCI HAR Dataset Avg.csv     The file containing the condensed dataset.
UCI HAR Dataset.zip         The original data files.
codebook.txt                A description of the contents of the condensed dataset.
run_analysis.R              A R script for regenerating the condensed dataset from the original data.

## Instructions for recreating the condensed dataset.

1. Clone this repository into a local directory.

2. Extract the contents of "UCI HAR Dataset.zip" in the local directory (e.g., via the "Extract here" option in WinZip or WinRAR.

3. Start R-Studio or R, and set the current working directory to the local directory containing the cloned files.

4. Source the "run_analysis.R" script to recreate the file "UCI HAR Dataset Avg.csv".
