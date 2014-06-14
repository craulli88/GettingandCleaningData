runanalysis <- function() {
  getdir <- getwd()
  dir <- paste(getdir, "/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train", sep="")
  setwd(dir)
  strain = read.table("subject_train.txt" , header=FALSE)  
  xtrain = read.table("X_train.txt" , header=FALSE)
  ytrain = read.table("y_train.txt" , header=FALSE)
  trainmerge <- cbind(xtrain, ytrain)
  trainmerge <- cbind(trainmerge, strain)
  dir <- paste(getdir, "/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test", sep="")
  setwd(dir)  stest = read.table("subject_test.txt" , header=FALSE)  
  xtest = read.table("X_test.txt" , header=FALSE)
  ytest = read.table("y_test.txt" , header=FALSE)
  testmerge <- cbind(xtest, ytest)
  testmerge <- cbind(testmerged, stest)
  
  finalmerge <- rbind(trainmerge, testmerged)
  
  dropcols <- finalmerge[-c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 227:228, 240:241, 253:254, 266:271, 294:296, 
                            345:350, 373:375, 424:429, 452:454, 503:504, 516:517, 529:530, 539, 542:543, 552, 556:561)]
  
  dropcols$V1[dropcols$V1 == 1] <- "WALKING"
  dropcols$V1[dropcols$V1 == 2] <- "WALKING_UPSTAIRS"
  dropcols$V1[dropcols$V1 == 3] <- "WALKING_DOWNSTAIRS"
  dropcols$V1[dropcols$V1 == 4] <- "SITTING"
  dropcols$V1[dropcols$V1 == 5] <- "STANDING"
  dropcols$V1[dropcols$V1 == 6] <- "LAYING"
  
  colnames(dropcols)[481] <- "Activity"
  colnames(dropcols)[482] <- "Subjects"
  
  library(reshape)
  newtidymelt <- melt(dropcols, id=c("Activity", "Subjects"))
  newtidycast <- cast(newtidymelt, Activity~Subjects, mean)
  write.table(newtidycast, "C:/Users/p97244/Documents/tidydata.txt", sep="\t")
}
  
