## Preparation
setwd("C:/Coursera/DataScientitist's/EDA/Data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## code of plot2.R
subsetNEI  <- NEI[NEI$fips=="24510", ]
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)
png('plot2.png')
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('PM'[2.5]*' emission'),main=expression('PM'[2.5]*' in the Baltimore City, MD emissions in years'))
dev.off()
