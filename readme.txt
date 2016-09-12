Indian Liver Patient Dataset
============================
3.Review the patterns described in DataScience01a.R and use R to get the Indian Liver Patient Dataset from the UCI machine learning repository. 
• url <- “http://archive.ics.uci.edu/ml/machine-learningdatabases/00225/Indian%20Liver%20Patient%20Dataset%20(ILPD).csv” # Copy this url carefully 
• ILPD <- read.csv(url, header=FALSE, stringsAsFactors=FALSE) 
4. The following was not covered in class.  Get the 11 column headers from this page: http://archive.ics.uci.edu/ml/datasets/ILPD+(Indian+Liver+Patient+Dataset)# 
• Manually construct a vector of column headers using this pattern: 
• a.headers <- c(<name1>, <name2>, …) # Each column has a name • Associate names with the dataframe using this pattern: 
• a.names(<dataframe>) <- headers 
5. Use head(ILPD) to view the first 6 rows. 
6. Review the patterns described in DataScience01a.R.  
Write code to determine the mean, median, and standard deviation (sd) of each column and present their values in the console. Some calculations may fail.  Fix the problem by using na.rm = TRUE. Type ?median to see how. 
7. Review the patterns described in DataScience01a.R Create Histograms (hist) for each column where possible. 
8. Review the patterns described in DataScience01a.R Use the plot(ILPD) function on this data frame to present a general overview of the data. You want to see a matrix of many plots. 
9. Look at the plots from plot(ILPD) and answer:  
• What can you say about the data? 
• How can you tell if a vector contains continuous numbers or binary data? 
• How can you tell if two vectors are correlated? 
10. Review the patterns described in DataScience01b.R  Write code to remove outliers from the following vector and present the result in the console: c(-1, 1, 5, 1, 1, 17, -3, 1, 1, 3) 
11. Review the patterns described in DataScience01b.R  Write code to relabel the following vector.  Use the shortest strings for each category in the relabeled version. Present the result in the console: c('BS', 'MS', 'PhD', 'HS', 'Bachelors', 'Masters', 'High School', 'BS', 'MS', 'MS')  
12. Review the patterns described in DataScience01b.R  Write code to normalize the following vector using a Min-Max normalization and present the result in the console:  c(-1, 1, 5, 1, 1, 17, -3, 1, 1, 3) 
13. Review the patterns described in DataScience01b.R  Write code to normalize the following vector using a Z-score normalization and present the result in the console:  c(-1, 1, 5, 1, 1, 17, -3, 1, 1, 3)  
14. Review the patterns described in DataScience01b.R  Write code to binarize: c('Red', 'Green', 'Blue', 'Blue', 'Blue', 'Blue', 'Blue', 'Red', 'Green', 'Blue')  and present the result in the console 
15. Review the patterns described in DataScience01b.R  Write code to discretize the following vector into 3 bins of equal range and present the result in the console: c(3, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 9, 12, 23, 23, 25, 81) 
16. Discretize the following vector into 3 bins of equal of near equal amounts of numbers and present the result in the console.  No Code is necessary.  Writing equalization code is tricky: c(3, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 9, 12, 23, 23, 25, 81) 