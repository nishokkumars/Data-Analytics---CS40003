library(openxlsx)
DATA <- read.xlsx("GAMES.xlsx")
DATA <- subset(DATA,!is.na(DATA[,4])&!is.na(DATA[,16]))
frequencyTable <- table(DATA[ ,4],DATA[,16])
paste("The required contingency table is as follows")
print(frequencyTable)
H <- c(frequencyTable[1,8],frequencyTable[2,8],frequencyTable[3,8],frequencyTable[4,8],frequencyTable[5,8],frequencyTable[6,8],frequencyTable[7,8],frequencyTable[8,8],frequencyTable[9,8],frequencyTable[10,8],frequencyTable[11,8],frequencyTable[12,8])
M <- c( "Action","Adventure","Fighting","Misc","Platform","Puzzle","Racing","Role-Playing","Shooter","Simulation","Sports","Strategy")
barplot(H,names.arg = M,xlab = "Genre",ylab = "Number of teens giving rating",col = "blue",
main = "BAR PLOT BETWEEN GENRES AND NUMBER OF TEEN RATINGS",border = "red")

       

