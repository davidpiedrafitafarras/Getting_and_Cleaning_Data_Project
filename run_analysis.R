run_analysis <-function() {

    #Prepare the environment, check if package reshape2 exists and is loaded

    reshape2NotInstalled<-(!("reshape2" %in% installed.packages()))
    reshape2NotLoaded<-(!("reshape2" %in% loadedNamespaces()))
    
    if(reshape2NotInstalled) install.packages("reshape2")
    
    if(reshape2NotLoaded) library("reshape2")
    
    #The zip is considered to be in the working directory
    
    unzip("./Dataset.zip",exdir=".")

    #Read the features file
    
    features<-read.table("./UCI HAR Dataset/features.txt")

    #Select only the variables labeled as mean() or std(). The angles are not
    #considered as they are already processed data

    SelectedFeatures<-features[grep("mean\\(|std\\(",features$V2),]
    SelectedFeatures$V2<-gsub("\\(\\)","",SelectedFeatures$V2)
    SelectedFeatures$V2<-gsub("-","_",SelectedFeatures$V2)
    
    #Read the data for each group

    RawDataSetTrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
    SubjectsTrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")
    ActivitiesTrain<-read.table("./UCI HAR Dataset/train/y_train.txt")

    RawDataSetTest<-read.table("./UCI HAR Dataset/test/X_test.txt")
    SubjectsTest<-read.table("./UCI HAR Dataset/test/subject_test.txt")
    ActivitiesTest<-read.table("./UCI HAR Dataset/test/y_test.txt")

    RawDataSet<-rbind(RawDataSetTrain,RawDataSetTest)
    Subjects<-rbind(SubjectsTrain,SubjectsTest)
    Activities<-rbind(ActivitiesTrain,ActivitiesTest)

    DataSet<-RawDataSet[,SelectedFeatures$V1]

    #Name the columns of the dataSet, consider names of the selected columns

    colnames(DataSet)<-SelectedFeatures$V2
    colnames(Activities)<-"Activity"
    colnames(Subjects)<-"Subject"

    #Reads the activity labels from the appropiate file. As the labels are in
    #correct order they will be used as levels. See appropiate line

    activityLabels<-read.table("./UCI HAR Dataset//activity_labels.txt")

    #Pack the 3 different sources with cbind in order to maintain the order

    OriginalDataSet<-cbind(Subjects,DataSet,Activities)

    #Convert the values in Activity to factors

    OriginalDataSet$Activity<-as.factor(OriginalDataSet$Activity)

    #Change factor names in order to give a descriptive name to the activities

    levels(OriginalDataSet$Activity)<-activityLabels$V2

    #DataSet is melted in order to obtain a unique id-variable combination
    #Uses reshape package.

    DataSetMelt<-melt(OriginalDataSet,id=c("Subject","Activity"))

    # Get the average of the variables for each subject-Activity pair

    tidyDataSet<-dcast(DataSetMelt,Subject+Activity ~ variable, mean)

    unlink("./UCI HAR Dataset",recursive = TRUE)

    #Writes the tidy dataset to a txt file in the working directory

    write.table(tidyDataSet,"./tidyDataSet.txt", row.names=FALSE)

    #Clean the enviroment
    
    if(reshape2NotLoaded) unloadNamespace("reshape2")

    if(reshape2NotInstalled) remove.packages("reshape2")
        
    return(TRUE)
}