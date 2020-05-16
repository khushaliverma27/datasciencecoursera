## Import the necessary libraries
library(ggplot2)
library(RColorBrewer)
library(plyr)
library(dplyr)

## Read the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Plotting the graph
vehicles1 <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))
vehicles <- SCC[SCC$EI.Sector %in% vehicles1, ]["SCC"]
vehiclesBaltimore <- NEI[NEI$SCC %in% vehicles$SCC & NEI$fips == "24510",]
vehiclesBaltimoreYearly <- ddply(vehiclesBaltimore, .(year), function(x) sum(x$Emissions))
colnames(vehiclesBaltimoreYearly)[2] <- "emissions"

png(file="J:/datasciencecoursera/Week4_Course4/Plot5.png")
qplot(year, emissions, data = vehiclesBaltimoreYearly, geom = "line", color = emissions, size = 1) + ggtitle("PM2.5 Emissions by Motor Vehicles in Baltimore City") + xlab("Year") + ylab("PM2.5 Emissions in Tons")
dev.off()