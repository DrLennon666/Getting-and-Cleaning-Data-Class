# Written while listening to the Atlas Moth record entitled "The Old Believer"
# Assume user has set their working directory appropriately

setwd("C:\\Users\\Craig\\Documents\\R Class\\Getting and Cleaning Data Class\\Class Project\\UCI HAR Dataset\\required data files\\")

# The activities montoried using mobile phone accelerometers
activity<-read.table("activity_labels.txt")

# Partially analyzed accelerometer data labels
labels<-read.table("features.txt")


##############################################################################
#                              Test Data


# Partially analyzed accelerometer test data. Read it and name the columns appropriately
test_set<-read.table("X_test.txt")
names(test_set)<-labels[,2]
# Test Subjects
test_subject<-read.table("subject_test.txt")
names(test_subject)<-"Subject"

test_activity_labels<-read.table("y_test.txt") #need to use activity to file to match

# Create a new data table in which the integer markers in test_activity_labes are
# replaced with the text values from the 6 activities in activity
new_test_label<-c()
for (item in test_activity_labels[,1]){

if(item==1){new_test_label<-c(new_test_label,as.character(activity[1,2]))}
else if (item==2){new_test_label<-c(new_test_label,as.character(activity[2,2]))}
else if (item==3){new_test_label<-c(new_test_label,as.character(activity[3,2]))}
else if (item==4){new_test_label<-c(new_test_label,as.character(activity[4,2]))}
else if (item==5){new_test_label<-c(new_test_label,as.character(activity[5,2]))}
else if (item==6){new_test_label<-c(new_test_label,as.character(activity[6,2]))}
  
}

new_test_label<-as.data.frame(new_test_label)
names(new_test_label)<-"Activity"



#Combine the test set date with the associated activities
test_set<-cbind(test_set,test_subject)
test_set<-cbind(test_set,new_test_label)



###################################
# need to extract test mean and test std columns
#1:6,41-46,81-86,121-126,161-166,201,202,214,215,227,
#228,240,241,253,254,266-271,345-350,424-429,503,504,516,517,529,530
test_mean_std_indices<-c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,562,563)
small_test_set<-test_set[test_mean_std_indices]

#############################################################################
#                                 Training Data


# Partially analyzed accelerometer training data. Read it and name the columns appropriately
train_set<-read.table("X_train.txt")
names(train_set)<-labels[,2]

# Subjects
train_subject<-read.table("subject_train.txt")
names(train_subject)<-"Subject"

train_activity_labels<-read.table("y_train.txt") #need to use activity to file to match

# Create a new data table in which the integer markers in test_activity_labes are
# replaced with the text values from the 6 activities in activity
new_train_label<-c()
for (item in train_activity_labels[,1]){
  
  if(item==1){new_train_label<-c(new_train_label,as.character(activity[1,2]))}
  else if (item==2){new_train_label<-c(new_train_label,as.character(activity[2,2]))}
  else if (item==3){new_train_label<-c(new_train_label,as.character(activity[3,2]))}
  else if (item==4){new_train_label<-c(new_train_label,as.character(activity[4,2]))}
  else if (item==5){new_train_label<-c(new_train_label,as.character(activity[5,2]))}
  else if (item==6){new_train_label<-c(new_train_label,as.character(activity[6,2]))}
  
}

new_train_label<-as.data.frame(new_train_label)
names(new_train_label)<-"Activity"

#Combine the test set date with the associated activities
train_set<-cbind(train_set,train_subject)
train_set<-cbind(train_set,new_train_label)




###################################
# need to extract train mean and train std columns
train_mean_std_indices<-c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,562,563)
small_train_set<-train_set[train_mean_std_indices]


#Combine the small test and small training datasets
combined_small<-rbind(small_train_set,small_test_set)


#Create a second, independent tidy data set with the average of 
#each variable for each activity and each subject. 

# Use the aggregate function over variable 1:64, these are the measurments
# aggregate by columns 65 and 66, the subject and activity respectively.
# apply mean to columns 1:64
# order tidy data by the subject number
tidy_data=aggregate.data.frame(combined_small[1:64], by=c(combined_small[,65:66]),FUN=mean)
tidy_data=tidy_data[order(tidy_data$Subject),]

# Make more descriptive names for tiny data
tidy_names=names(tidy_data)

new_names=c()
for (i in tidy_names[3:66]){
  new_names=c(new_names,paste("mean(",i,")",sep=""))
}
new_names=c("Subject","Activity",new_names)
names(tidy_data)<-new_names


# Write the tidy data set as a tab delimited file (excel defaults to tab delim)
# the file is written to the working directory.
# the first written column can be ignored as this is just the original row label before
# the order function was called.

#  write of data with row names set to FALSE to prevent
# extra column of row names
write.table(tidy_data,file="tidy_data.txt",sep="\t",row.names=FALSE)



