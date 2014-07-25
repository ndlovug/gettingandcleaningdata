run_analysis <- function() {
  
  #download the data but not required in the code to be submitted
  #so commenting it out
  library(qdap)
  
  #dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  #temp <- tempfile()
  #download.file(dataUrl,temp)
  
  #dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  #temp <- tempfile()
  #download.file(dataUrl,temp)
  
  #for (i in temp) {
  #  unzip(i)
  #}
  
  #unlink(temp)
  
  #names of the variables, 561
  cnames <- read.table(file = "./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
  ############################get training data####################################################################
  #get the 7352 activities for the subjects in training, range 1:6
  ytrain <- read.table(file = "./UCI HAR Dataset/train/y_train.txt", stringsAsFactors = FALSE)
  #get the 7352 subjects / participants in training, range 1:30
  subjecttrain <- read.table(file = "./UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE)
  #read in the raw data w/ the measurements for the subjects in training
  traindfraw <- read.table(file = "./UCI HAR Dataset/train/X_train.txt")
  #add subject & activity & measurements
  traindf <- data.frame(cbind(subjecttrain, ytrain, traindfraw))
  #########################################get test data###########################################################
  #get the 2947 activities for the subjects in test, range 1:6
  ytest <- read.table(file = "./UCI HAR Dataset/test/y_test.txt", stringsAsFactors = FALSE)
  #get the 2947 subjects / participants for the subjects in test, range 1:30
  subjecttest <- read.table(file = "./UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE)
  #read in the raw data w/ the measurements for the subjects in test
  testdfraw <- read.table(file = "./UCI HAR Dataset/test/X_test.txt")
  #add subject & activity & measurements
  testdf <- data.frame(cbind(subjecttest, ytest, testdfraw))
  #################################################################################################################
  #########################combine train and test data#############################################################
  #combined dataframe (cdf)
  cdf <- data.frame(rbind(traindf, testdf))
  #change the column names
  names(cdf) <- c("subject", "activity", cnames$V2)
  ms <- data.frame(grepl("mean\\(|std\\(",names(cdf)))
  mst <- data.frame(cbind(as.integer(rownames(ms)), ms))
  names(mst) =c("colnum", "include")
  smallmst <- mst[mst$include, ]
  smallcdf <- cdf[ , c(1:2, smallmst[, 1])]
  #####################################get activity labels#########################################################
  #get the labels in, range 1:6
  actlabels <- read.table(file = "./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
  smallcdf$activity <- as.character(apply(data.frame(smallcdf$activity), 2, lookup, actlabels))
  tidydf <- aggregate(x = smallcdf[, 3:ncol(smallcdf)], by = list("subject" = smallcdf$subject, "activity" = smallcdf$activity), FUN = mean)
  write.table(x = tidydf, file = "tidydf.txt", sep = "\t")
}



