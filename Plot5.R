require(ggplot2)
# Read data from files

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Aggregate total emissions in Baltimore, convert from tons to kilotons
SCC1<-SCC[grepl("Motor Vehicles", SCC$Short.Name),]
mdata<- merge(NEI, SCC1, by = "SCC")


Balt <- subset(NEI, fips == "24510" & type == "ON-ROAD")
BaltPM <- aggregate(Balt[c("Emissions")], list(year = Balt$year,type = Balt$type), sum)


qplot(year, Emissions, data = BaltPM,  color=type, geom=c("point", "smooth"), xlab = "Year", 
      ylab = expression("Emissions of PM in tons"), 
      main = expression("Total Emissions of Motor Vehicles in Baltimore"))