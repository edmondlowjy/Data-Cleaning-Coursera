rm(list=ls())

### General Descriptors ###

activity_labels=read.table('/Users/edmondlowjy/datasciencecoursera/Data-Cleaning/Week\ 4/UCI\ HAR\ Dataset/activity_labels.txt',sep=' ',stringsAsFactors = F,col.names = c('Activity_Label','Activity'))
features=read.table('/Users/edmondlowjy/datasciencecoursera/Data-Cleaning/Week\ 4/UCI\ HAR\ Dataset/features.txt',sep=' ',stringsAsFactors = F,col.names = c('Measurement_Label','Measurement'))

### Reading in Training Set Data ###

y_train=read.table('/Users/edmondlowjy/datasciencecoursera/Data-Cleaning/Week\ 4/UCI\ HAR\ Dataset/train/y_train.txt',col.names = c('Activity_Label'))
X_train=read.table('/Users/edmondlowjy/datasciencecoursera/Data-Cleaning/Week\ 4/UCI\ HAR\ Dataset/train/X_train.txt')
subject_train=read.table('/Users/edmondlowjy/datasciencecoursera/Data-Cleaning/Week\ 4/UCI\ HAR\ Dataset/train/subject_train.txt',col.names = c('Subject'))

### Reading in Test Set Data ###

y_test=read.table('/Users/edmondlowjy/datasciencecoursera/Data-Cleaning/Week\ 4/UCI\ HAR\ Dataset/test/y_test.txt',col.names = c('Activity_Label'))
X_test=read.table('/Users/edmondlowjy/datasciencecoursera/Data-Cleaning/Week\ 4/UCI\ HAR\ Dataset/test/X_test.txt')
subject_test=read.table('/Users/edmondlowjy/datasciencecoursera/Data-Cleaning/Week\ 4/UCI\ HAR\ Dataset/test/subject_test.txt',col.names = c('Subject'))

### Combining datasets and removing obsolete ones

combined_data=rbind(cbind(subject_train,y_train,X_train),cbind(subject_test,y_test,X_test))
rm(list=setdiff(ls(), c("combined_data",'activity_labels','features')))

### Extracting the mean & sd measurements & naming the dataset

measurement.index=grep('mean[()]|std[()]',features$Measurement)+2
combined_data=combined_data[,c(1,2,measurement.index)]
names(combined_data)=c(names(combined_data[,(1:2)]),features$Measurement[(measurement.index-2)])

#Note: There's a need to +-2 for measurement.index to account 
# for the previous rbind of Subject and Activity Labels

### Name the Activities in the dataset

combined_data$Activity_Label=activity_labels$Activity[combined_data$Activity_Label]
names(combined_data)=c(names(combined_data)[1],'Activity',names(combined_data)[-(1:2)])
rm(list=setdiff(ls(), c("combined_data")))

### Tidying data using dplyr

library(dplyr)

tidy_data<- tbl_df(combined_data) %>%
  group_by(Subject,Activity) %>%
  summarize_all(mean)

### Manual verification if dplyr performed as expected

tidy_data[1,-(1:2)]==colMeans(combined_data[(combined_data$Subject==1 & combined_data$Activity=='LAYING'),-(1:2)])
rm(list=setdiff(ls(), c("tidy_data")))

### Output the Tidy Data

write.table(tidy_data,file=paste0(getwd(),'/tidy_data.txt'),row.names = F)

