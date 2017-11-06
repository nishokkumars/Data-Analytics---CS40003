library("graphics")
library("psych")
library("MASS")
#symboling       :       Ordinal
#normalized losses:      Ratio
#make            :       Nominal
#fuel-type       :       Nominal
#aspiration      :       Nominal
#num-of-doors    :       Ordinal
#body-style      :       Nominal
#drive-wheels    :       Nominal
#engine-location :       Nominal
#wheel-base      :       Ratio
#length          :       Ratio
#width           :       Ratio
#height          :       Ratio
#curb-weight     :       Ratio
#engine-type     :       Nominal
#num-of-cylinders:       Ratio
#engine-size     :       Ordinal
#fuel-system     :       Nominal
#bore            :       Interval
#stroke          :       Interval
#compression-ratio:      Ratio
#horsepower      :       Ratio
#peak-rpm        :       Ratio
#city-mpg        :       Ratio
#highway-mpg     :       Ratio
#price           :       Ratio
getmode <- function(v) {
   uniqv <- unique(v)
   uniqv[which.max(tabulate(match(v, uniqv)))]
}
df <- read.csv("AUTOMOBILES.csv")
dfd = df[[19]]
remove <- c ("?")
dfd = dfd [dfd != "?"]
sum <- 0
ind <- 1
y <- c(0,0)
for(i in dfd)
{
 y[ind] <- as.numeric(i)
 ind <- ind + 1
}
for(i in dfd)
{
   sum <- sum + as.numeric(i)
}
sum <- sum/205
mer <- mean(df[[25]],na.rm=TRUE)
mon <- getmode(df[[3]])
moo <- getmode(df[[6]])
mor <- getmode(df[[25]])
moi <- getmode(dfd)
medi <- median(y)
medr <- median(df[[25]])

print(c("Type","Name","Mean","Median","Mode"))
print(c("Nominal","Make","-","-",mon))
print(c("Ordinal","num-of-doors","-","-",moo))
print(c("Interval","bore",sum,medi,moi))
print(c("Ratio","highway-mpg",mer,medr,mor))

pr = df[["peak-rpm"]]
pr = pr[ pr != "?" ]
ind <- 1
pr1 <- c(0,0)
for(i in pr)
{
 pr1[ind] <- as.numeric(i)
 ind <- ind + 1
}

den_pr = density(pr1)
plot(den_pr,main = "Peak rpm")

cm = df[["city-mpg"]]
cm = cm[ cm != "?" ]
ind <- 1
cm1 <- c(0,0)
for(i in cm)
{
 cm1[ind] <- as.numeric(i)
 ind <- ind + 1
}

den_cm = density(cm1)
plot(den_cm,main = "City mpg")
