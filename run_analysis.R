run_analysis <- function() {
  library(data.table)
  
  #set up paths
  dir <- "UCI HAR Dataset/"
  testDir <- paste(dir,"test/",sep="")
  trainDir <- paste(dir,"train/",sep="")

  #load in the raw data
  features<-data.table(read.table(paste(dir,"features.txt",sep="")))
  activities<-data.table(read.table(paste(dir,"activity_labels.txt",sep="")))
  
  trainX<-read.table(paste(trainDir,"X_train.txt",sep=""))
  trainy<-data.table(read.table(paste(trainDir,"y_train.txt",sep="")))
  trainSubject<-data.table(read.table(paste(trainDir,"subject_train.txt",sep="")))
  
  testX<-read.table(paste(testDir,"X_test.txt",sep=""))
  testy<-data.table(read.table(paste(testDir,"y_test.txt",sep="")))
  testSubject<-data.table(read.table(paste(testDir,"subject_test.txt",sep="")))
 
  #merge rows
  combinedX<-rbind(trainX,testX)
  combinedy<-rbind(trainy,testy)
  combinedSubject<-rbind(trainSubject,testSubject)
  
  #identify columns to keep
  meanCols<-grepl("mean\\(\\)",features$V2)
  stdCols<-grepl("std\\(\\)",features$V2)
  colsToKeep<-stdCols|meanCols|meanCols2
  keptX<-data.table(combinedX[,colsToKeep])
  labelsX<-features[colsToKeep,]
  
  #add colnames
  setnames(combinedSubject,"V1","SubjectId")
  setnames(activities,colnames(activities),c("num","label"))
  setnames(keptX,colnames(keptX),as.character(labelsX$V2))
  
  #add labels to y data
  combinedy[,Activity:=activities[V1,label]]
  combinedy[,V1:=NULL]

  #combine all the columns
  combined<-cbind(combinedSubject,keptX,combinedy)
  
  #tidy up
  combined$SubjectId<-as.factor(combined$SubjectId)
  
  summary<-combined[, lapply(.SD, mean, na.rm=TRUE), by="SubjectId,Activity"]
  
  return(summary)
}