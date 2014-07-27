gettingandcleaningdata
======================

This repo will house the R script and the resulting tidy dataset for the Coursera class project for the Getting and Cleaning Data class.

To run the script, save run_analysis.R in your working directory. Using the source function in R, read in the R code. 

Sourcing the R code will present a function, also labelled as run_analysis. This function does not take in any inputs and running the function will generate the tidy data. For the function to work properly, please ensure that there is a folder in your working directory that contains the data from the source.
Please make sure the folder is labelled UCI HAR Dataset and contains all the child folders organized as the source data that we downloaded from the link provided in the instructions.

The script run_analysis.R downloads zipped data from the web, unzips the data, and reads in the training and test data. It sounded like the part to download and unzip wasn't required so even though my script does that, I commented that part out.

The scripts combines the three aspects of the raw data: the subjects, the activities, and the measurements.

The script also adds in smart column labels for the fields (after the two data sets have been combined) and then the script subsets the raw data, only keeping the standard deviation and mean of the measured fields.

The script finally aggregates the measure data by subject and by activity. 

