library(gdata)
library(corrplot)
DATA <- read.xls("SNACKS.xls")
DATA[] <- lapply(DATA, function(x) as.numeric(x))
data <- cbind(matrix( c(DATA[ ,1],DATA[ ,2],DATA[,3]), ncol=3),matrix( c(DATA[ ,4],DATA[,5]), ncol=2 ))
R <- cor(data, method='spearman', use="complete.obs")
paste("Spearman correlation matrix of all the ordinal attributes is:")
print(R)
cor <- R
for(i in 1:5)
{
	for(j in 1:5)
	{
		cor[i,j]=R[i,j]*R[i,j]
	}
}
print("Coefficient of determination matrix is:")
print(cor)
library(corrplot)
colnames(R) <- c("Liking scores", "Saltiness", "Sweetness", "Acidity", "Crunchiness")
rownames(R) <- c("Liking scores", "Saltiness", "Sweetness", "Acidity", "Crunchiness")
corrplot(R, method="color",main="CORRELATION EXTENT")
paste("From coefficient of determination matrix and correlation matrix plot we can find strength of correlation between attributes")
