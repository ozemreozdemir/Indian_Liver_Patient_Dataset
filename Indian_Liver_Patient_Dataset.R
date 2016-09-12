###################################################################
#OZKAN EMRE OZDEMIR
#HOMEWORK ASSIGNMENT #1 1/17/2016
###################################################################
# Clear Workspace
rm(list=ls())
# Clear Console:
cat("\014")
###################################################################
# 3. Use R to get the Indian Liver Patient Dataset from the UCI machine learning repository.
# assign a url to variable "url"
url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00225/Indian%20Liver%20Patient%20Dataset%20(ILPD).csv"
ILPD<- read.csv(url, header=FALSE, stringsAsFactors=FALSE)

# 4. Get the 11 column headers from this page: http://archive.ics.uci.edu/ml/datasets/ILPD+(Indian+Liver+Patient+Dataset)#
#1. Age	#2. Gender #3. TB #4. DB #5. Alkphos #6. Sgpt #7. Sgot #8. TP #9. ALB #10. A/G Ratio #11. Selection (1 OR 2) 
#Manually construct a vector of column headers using this pattern:
headers <- c("Age", "Gender", "TB", "DB", "Alkphos", "Sgpt", "Sgot", "TP", "ALB", "A/G", "Selection")
names(ILPD) <- headers

#5. Use head(ILPD) to view the first 6 rows
head(ILPD)

#6. Write code to determine the mean, median, and standard deviation (sd) of each column.
#summary(ILPD)
sapply(ILPD, sd, na.rm = T)
sapply(ILPD, mean, na.rm=T)
sapply(ILPD, median, na.rm = T)

#7. Create Histograms (hist) for each column where possible.
hist(ILPD$Age, col=rgb(0,1,0,.5)) 
#hist(ILPD$Gender, col=rgb(0,1,0,.5))
hist(ILPD$TB, col=rgb(0,1,0,.5)) 
hist(ILPD$DB, col=rgb(0,1,0,.5)) 
hist(ILPD$Alkphos, col=rgb(0,1,0,.5))
hist(ILPD$Sgpt, col=rgb(0,1,0,.5)) 
hist(ILPD$Sgot, col=rgb(0,1,0,.5))
hist(ILPD$TP, col=rgb(0,1,0,.5)) 
hist(ILPD$ALB, col=rgb(0,1,0,.5)) 
hist(ILPD$"A/G", col=rgb(0,1,0,.5))
hist(ILPD$Select, col=rgb(0,1,0,.5))

#8. Present a general overview of the data
plot(ILPD[-2]) # Skip the Gender column

#9 .What can you say about the data?

#.How can you tell if a vector contains continuous numbers or binary data?
# The general overview of the data (the plot function) helps to find out the vector which contains
# the binary data. In this example, we have the selector field (the last vector) that was used
# to split the data into two sets and it only contains "1" and "2". Therefore, the resulted "selection plot"
# does not provide a meaningful relationship with the rest of the data by itself.

#.How can you tell if two vectors are correlated?
# The general overview data shows that there is a linear correlation between the Total Bilirubin (TB) and
# the Direct Bilirubin (DB). In addition, the "Age" vector shows that patients who are around 30 years old
# have higher bilirubin and alamine (Sgpt) levels which may relate to high chance of having patients suffering
# liver damages at age 30.
###################################################################
# Clear Workspace
rm(list=ls())
# Clear Console:
cat("\014")
###################################################################
#10 Write code to remove outliers from the following vector and 
#present the result in the console: c(-1, 1, 5, 1, 1, 17, -3, 1, 1, 3)

x <- c(-1, 1, 5, 1, 1, 17, -3, 1, 1, 3)
highLimit <- mean(x) + 2*sd(x)
lowLimit <- mean(x) - 2*sd(x)
goodFlag <- (x < highLimit) & (x > lowLimit)
x[goodFlag]
x
x <- x[goodFlag]
x
#OR
x <- c(-1, 1, 5, 1, 1, 17, -3, 1, 1, 3)
x
x <- x[(x < mean(x) + 2*sd(x)) & (x >  mean(x) - 2*sd(x))]
x
###################################################################
# Clear Workspace
rm(list=ls())
# Clear Console:
cat("\014")
###################################################################
#11 Write code to relabel the following vector. 
#Use the shortest strings for each category in the relabeled version.

x <- c('BS', 'MS', 'PhD', 'HS', 'Bachelors', 'Masters', 'High School', 'BS', 'MS', 'MS')

x[x == "Bachelors"] <- "BS"
x[x == "Masters"] <- "MS"
x[x == "High School"] <- "HS"
x[x == "Doctorate"] <- "PhD"
x

#12 Write code to normalize the following vector using a Min-Max normalization.

x <- c(-1, 1, 5, 1, 1, 17, -3, 1, 1, 3)
a <- min(x)
b <- max(x) - min(x)
normalized <- (x - a) / b
normalized

#13 Write code to normalize the following vector using a Z-score normalization.

x <- c(-1, 1, 5, 1, 1, 17, -3, 1, 1, 3)
a <- mean(x)
b <- sd(x)
normalized <- (x - a) / b
normalized

#14 Write code to binarize: 
#c('Red', 'Green', 'Blue', 'Blue', 'Blue', 'Blue', 'Blue', 'Red', 'Green', 'Blue')

x <- c('Red', 'Green', 'Blue', 'Blue', 'Blue', 'Blue', 'Blue', 'Red', 'Green', 'Blue')

isRed <- x == 'Red'
isGreen <- x == 'Green'
isBlue <- x == 'Blue'

#cast T/F into 1/0
isRed <- as.numeric(isRed)
isGreen <- as.numeric(isGreen)
isBlue <- as.numeric(isBlue)

isRed; isGreen; isBlue
#OR Better Presentation
data.frame(isRed, isGreen, isBlue)

#15 Write code to discretize the following vector into 3 bins of equal range.
x <- c(3, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 9, 12, 23, 23, 25, 81)
range <- max(x) - min(x)
binWidth <- range / 3 #split into 3
bin1Min <- -Inf
bin1Max <- min(x) + binWidth
bin2Max <- min(x) + 2*binWidth
bin3Max <- Inf
xDiscretized <- rep(NA, length(x))
xDiscretized
xDiscretized[bin1Min < x & x <= bin1Max] <- "Very Low"
xDiscretized[bin1Max < x & x <= bin2Max] <- "Low"
xDiscretized[bin2Max < x & x <= bin3Max] <- "High"
xDiscretized

#16 Discretize the following vector into 3 bins of equal of near equal amounts of numbers
x <- c(3, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 9, 12, 23, 23, 25, 81)
# [1] 3, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 9, 12, 23, 23, 25, 81
#    <-------------------------------|---------------------------------------|--------------->
# VeryLow:  3,4,5
veryLowMin <- -Inf
VeryLowMax <- 5
# Low:  6,7,8,9,12
LowMax <- 12
# High:  23,25,81
HighMax <- Inf
xDiscretized <- x
xDiscretized[veryLowMin < x & x <=  VeryLowMax] <- "Very Low"
xDiscretized[VeryLowMax < x & x <=      LowMax] <- "Low"
xDiscretized[LowMax     < x & x <=     HighMax] <- "High"
xDiscretized

# End Of Assignment #1
###################################################################