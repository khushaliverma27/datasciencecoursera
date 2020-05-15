## Import the necessary libraries
library(ggplot2)
library(RColorBrewer)

## Read the datasets
summarySCC <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Plotting the graph
totalNEI <- aggregate(Emissions ~ year, summarySCC, sum)
png(file="J:/datasciencecoursera/Week4_Course4/Plot1.png",width=480, height=480)
plot(totalNEI$year, totalNEI$Emissions, type = "o", col = "steelblue3", main = expression("Total US "~ PM[2.5]~ "Emissions by Year"), ylab = expression("Total US "~   PM[2.5] ~ "Emissions"), xlab = "Year")
dev.off()