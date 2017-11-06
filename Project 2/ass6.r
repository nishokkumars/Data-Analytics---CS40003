library(openxlsx)
DATA <- read.xlsx("STOCKS.xlsx")
DATA1 <- ts(DATA)
df <- plot.ts(DATA1)
paste("Time series is:")
print(DATA1)
#from the time series generated we can predict the value of stock on 1-10-2017 as
#open close high low
#48.52 48.04 49.13 48