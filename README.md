gettingandcleaningdata
======================

This repo will house the R script and the resulting tidy dataset for the Coursera class project for the Getting and Cleaning Data class.

The script run_analysis.R downloads zipped data from the web, unzips the data, and reads in the training and test data.

The scripts combines the three aspects of the raw data: the subjects, the activities, and the measurements.

The script also adds in smart column labels for the fields (after the two data sets have been combined) and then the script subsets the raw data, only keeping the standard deviation and mean of the measured fields.

The script finally aggregates the measure data by subject and by activity. 

