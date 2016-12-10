require(ggplot2)
# Read data from files

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Merge coal related SCC and NEI data set

SCC1<-SCC[grepl("coal", SCC$Short.Name),]
mdata<- merge(NEI, SCC1, by = "SCC")

#Aggregate emissions from coal-related combustion

adata<-aggregate(mdata[c("Emissions")], list(year = mdata$year), sum)

# Create  plot

qplot(year, Emissions, data = adata, geom = c("path", "point") , xlab = "Year", 
      ylab = expression("Emissions of PM"), 
      main = expression("Total emissions from coal-related combustion"))


