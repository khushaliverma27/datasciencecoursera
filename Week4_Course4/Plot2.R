## Import the necessary libraries
library(ggplot2)
library(RColorBrewer)

## Read the datasets
summarySCC <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Plotting the graph
baltimore <- subset(summarySCC, summarySCC$fips == "24510")
totalBaltimore <- aggregate(Emissions ~ year, baltimore, sum)

png(file="J:/datasciencecoursera/Week4_Course4/Plot2.png",width=480, height=480)
plot(totalBaltimore$year, totalBaltimore$Emissions, type = "o", main = expression("Total Baltimore" ~ PM[2.5] ~ "Emissions by Year"), xlab = "Year", ylab = expression("Total Baltimore "~ PM[2.5] ~ "Emissions"), col = "steelblue3")
dev.off()