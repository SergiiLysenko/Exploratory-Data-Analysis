require(ggplot2)
# Read data from files

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Aggregate total emissions in Baltimore, convert from tons to kilotons
SCC1<-SCC[grepl("Motor Vehicles", SCC$Short.Name),]
mdata<- merge(NEI, SCC1, by = "SCC")


Balt <- subset(mdata, fips == "24510" & type == "ON-ROAD")
BaltPM <- aggregate(Balt[c("Emissions")], list(year = Balt$year,type = Balt$type), sum)

LA<-Balt <- subset(mdata, fips == "06037" & type == "ON-ROAD")
LAPM <- aggregate(LA[c("Emissions")], list(year = LA$year,type = LA$type), sum)


ggplot(BaltPM,aes(year, Emissions))+geom_line(aes(color="motor vehicle sources in Los Angeles County"))+
        geom_line(data=LAPM,aes(color="motor vehicle sources in Baltimore City "))+
        labs(color="Total Emissions of Motor Vehicles")

