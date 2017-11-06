library("graphics")
library("openxlsx")
df <- read.xlsx("EARTHQUAKE.xlsx")
dB.iqr <- df
varas <- c("Time", "Latitude", "Longitude", "Depth/Km","Magnitude")
Outliers <- c()
print("Five point number summaries")
print(c("Time",fivenum(df[[1]])))
print(c("Latitude",fivenum(df[[2]])))
print(c("Longitude",fivenum(df[[3]])))
print(c("Depth",fivenum(df[[4]])))
print(c("Magnitude",fivenum(df[[5]])))

for(i in varas){

  mini <- quantile(dB.iqr[,i],0.25, na.rm=TRUE) - (IQR(dB.iqr[,i], na.rm=TRUE) * 1.5 )
  maxi <- quantile(dB.iqr[,i],0.75, na.rm=TRUE) + (IQR(dB.iqr[,i], na.rm=TRUE) * 1.5 )
  index <- which(dB.iqr[,i] < mini | dB.iqr[,i] > maxi)
  Outliers <- c(Outliers, index)
}
Outliers <- sort(Outliers)
dB.iqr <- dB.iqr[-Outliers,]
#Uncomment boxplot for making new boxplot pdf file
#boxplot(df[["Time"]],dB.iqr[["Time"]],show.names=TRUE,names=c("Time","TimeOutlier"))
#boxplot(df[["Latitude"]],dB.iqr[["Latitude"]],show.names=TRUE,names=c("Latitude","LatitudeOutlier"))
#boxplot(df[["Longitude"]],dB.iqr[["Longitude"]],show.names=TRUE,names=c("Longitude","LongitudeOutlier"))
#boxplot(df[["Depth/Km"]],dB.iqr[["Depth/Km"]],show.names=TRUE,names=c("Depth","DepthOutlier"))
#boxplot(df[["Magnitude"]],dB.iqr[["Magnitude"]],show.names=TRUE,names=c("Magnitude","MagnitudeOutlier"))
#print("Boxplots made")
#print(colnames(df))
