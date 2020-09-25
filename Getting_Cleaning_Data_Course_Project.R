library(dplyr)

#### Bases de datos

x_train <- read.table("C:/Users/admin'pc/Downloads/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")

y_train <- read.table("C:/Users/admin'pc/Downloads/UCI HAR Dataset/train/Y_train.txt", quote="\"", comment.char="")

s_train <- read.table("C:/Users/admin'pc/Downloads/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")

x_test <- read.table("C:/Users/admin'pc/Downloads/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")

y_test <- read.table("C:/Users/admin'pc/Downloads/UCI HAR Dataset/test/Y_test.txt", quote="\"", comment.char="")

s_test <- read.table("C:/Users/admin'pc/Downloads/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")


### Unir data

x_data <- rbind(x_train, x_test)

y_data <- rbind(y_train, y_test)

s_data <- rbind(s_train, s_test)