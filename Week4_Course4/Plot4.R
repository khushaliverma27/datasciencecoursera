## Import the necessary libraries
library(ggplot2)
library(RColorBrewer)

## Read the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Plotting the graph
coal_class_code <- SCC[grepl("Coal", SCC$Short.Name), ]
coal_emissions_data <- NEI[NEI$SCC %in% coal_class_code$SCC, ]

coal_emissions_year <- aggregate(coal_emissions_data$Emissions, 
                                 by=list(coal_emissions_data$year), FUN=sum)
colnames(coal_emissions_year) <- c("year", "emissions")

png(file="J:/datasciencecoursera/Week4_Course4/Plot4.png")
plot(coal_emissions_year$year, coal_emissions_year$emissions, type = "o",
     xlab = "Year",
     ylab = "Total Emissions (tons)",
     main = "Coal Related Emissions of PM2.5 in US from 1999-2008")
dev.off()