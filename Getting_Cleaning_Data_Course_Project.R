library(dplyr)
library(reshape2)

#### 1/Bases de datos

### Train Data
x_train <- read.table("C:/Users/admin'pc/Downloads/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
y_train <- read.table("C:/Users/admin'pc/Downloads/UCI HAR Dataset/train/Y_train.txt", quote="\"", comment.char="")
s_train <- read.table("C:/Users/admin'pc/Downloads/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")

### Test Data
x_test <- read.table("C:/Users/admin'pc/Downloads/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
y_test <- read.table("C:/Users/admin'pc/Downloads/UCI HAR Dataset/test/Y_test.txt", quote="\"", comment.char="")
s_test <- read.table("C:/Users/admin'pc/Downloads/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")

### 2/Unir data

x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
s_data <- rbind(s_train, s_test)

### 3/Extraer nombres

feature <- read.table("C:/Users/admin'pc/Downloads/UCI HAR Dataset/features.txt", quote="\"", comment.char="")

a_label <- read.table("C:/Users/admin'pc/Downloads/UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")
a_label[,2] <- as.character(a_label[,2])

selectedCols <- grep("-(mean|std).*", as.character(feature[,2]))
selectedColNames <- feature[selectedCols, 2]
selectedColNames <- gsub("-mean", "Mean", selectedColNames)
selectedColNames <- gsub("-std", "Std", selectedColNames)
selectedColNames <- gsub("[-()]", "", selectedColNames)

### 4/Agregar nombres descriptivos
x_data <- x_data[selectedCols]
allData <- cbind(s_data, y_data, x_data)
colnames(allData) <- c("Subject", "Activity", selectedColNames)

allData$Activity <- factor(allData$Activity, levels = a_label[,1], labels = a_label[,2])
allData$Subject <- as.factor(allData$Subject)

### 5/Generar data tidy
meltedData <- melt(allData, id = c("Subject", "Activity"))
tidyData <- dcast(meltedData, Subject + Activity ~ variable, mean)

write.table(tidyData, "C:/Users/admin'pc/Downloads/UCI HAR Dataset/tidy_dataset.txt", row.names = FALSE, quote = FALSE)
