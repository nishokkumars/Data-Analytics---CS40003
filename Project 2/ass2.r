library(openxlsx)
library(mgcv)
DATA <- read.xlsx("NUTRITION.xlsx")
DATA <- subset(DATA,!is.na(DATA[,10])&!is.na(DATA[,16]))
DATA[ ,10] <- sapply(DATA[,10],as.numeric)
DATA[ ,16] <- sapply(DATA[,16],as.numeric)
data <- cbind(matrix( DATA[ ,10], ncol=1),matrix( DATA[,16], ncol=1 ))
df <- cor(data,method="pearson",use="complete.obs")
r <- df[1,2]
r_2 <- r*r
paste("Correlation coefficient is equal to",r)
paste("Since r < 0 , correlation that exists is negative")
paste("r^2 = ",r_2)
scatterplot <- plot(DATA[,10],DATA[,16],main="SCATTER PLOT",xlab="Sugar content(Red)",ylab="Rating(blue)",col=c("red","blue"))
obj <- gam(DATA[ ,16] ~ s(DATA[ ,10]))
modelplot <- plot(obj,main="RELATION BETWEEN SUGAR CONTENT AND RATING",scheme=2)
paste("From gam plot,we can see that it is non linear correlation")

