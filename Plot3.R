require(ggplot2)
# Read data from files

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Aggregate total emissions in Baltimore, convert from tons to kilotons
Balt <- subset(NEI, fips == "24510")
BaltPM <- aggregate(Balt[c("Emissions")]/1000, list(year = Balt$year,type = Balt$type), sum)

#qplot( year, Emissions, data=BaltPM, color=type,alpha=density, geom="path",xlab = "Year",  ylab=, 
#        main= "Total emissions from PM")

qplot(year, Emissions, data = BaltPM,  color=type, geom=c("point", "smooth"), xlab = "Year", 
      ylab = expression("Emissions of PM in Ktons"), 
      main = expression("Total emissions from PM in Baltimore"))
