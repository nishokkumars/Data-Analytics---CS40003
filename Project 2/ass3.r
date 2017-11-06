library(openxlsx)
DATA <- read.xlsx("SALARY.xlsx")
DATA <- subset(DATA,(!is.na(DATA[ ,4])))
DATA <- subset(DATA,(!is.na(DATA[,5])))
DATA <- subset(DATA,(!is.na(DATA[,6])))
DATA <- subset(DATA,(!is.na(DATA[,7])))
DATA <- subset(DATA,(!is.na(DATA[,10])))
DATA[ ,5] <- sapply(DATA[ ,5],as.numeric)
DATA[ ,6] <- sapply(DATA[ ,6],as.numeric)
DATA[ ,7] <- sapply(DATA[ ,7],as.numeric)
DATA[ ,4] <- sapply(DATA[ ,4],as.numeric)
DATA[ ,10] <- sapply(DATA[ ,10],as.numeric)
DATA <- subset(DATA,DATA[ ,10]==2014)
col1 <- DATA[ ,4]
col2 <- DATA[ ,5]
col3 <- DATA[ ,6]
col4 <- DATA[ ,7]
data <- cbind(matrix( c(col2,col3,col4), ncol=3),matrix( col1, ncol=1 ))
cor(data, method="pearson",use="complete.obs")
#cor(data, method="spearman",use="complete.obs")
#By analysing the last column which gives correlation of  Overtime Pay, Other Pay and benefits with basic pay,we can see that they have a positive correlation.Hence they increase with basic pay