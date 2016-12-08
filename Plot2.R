# Read data from files

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Aggregate total emissions in Baltimore, convert from tons to kilotons
Balt <- subset(NEI, fips == "24510")
BaltPM <- aggregate(Balt[c("Emissions")]/1000, list(year = Balt$year), sum)

# Create the line plot
plot(BaltPM$year, BaltPM$Emissions, type="b", xlab = "Year", 
     ylab = expression("Emissions of PM in Ktons"), 
     main = expression("Total emissions from PM in Baltimore City"), col = "red")