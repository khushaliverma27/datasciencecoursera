## Import the necessary libraries
library(ggplot2)
library(RColorBrewer)

## Read the datasets
summarySCC <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Plotting the graph
baltimore <- subset(summarySCC, summarySCC$fips == "24510")
baltimoreType <- aggregate(Emissions ~ year + type, baltimore, sum)

png(file="J:/datasciencecoursera/Week4_Course4/Plot3.png",width=480, height=480)
ggplot(baltimoreType, aes(year, Emissions, col = type)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions by Type and Year")) +
  ylab(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions")) +
  xlab("Year") +
  scale_colour_discrete(name = "Type of sources") +
  theme(legend.title = element_text(face = "bold"))
dev.off()