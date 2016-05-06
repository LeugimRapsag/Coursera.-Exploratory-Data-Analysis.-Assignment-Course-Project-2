## Preparation
setwd("C:/Coursera/DataScientitist's/EDA/Data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")
library(ggplot2)

## code of plot4.R
coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)
png("plot4.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('PM'[2.5]*" Emissions")) +
  ggtitle('Emissions coal sources from 1999 to 2008')
print(g)
dev.off()
