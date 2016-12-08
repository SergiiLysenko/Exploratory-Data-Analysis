# Get the data from URL

fileUrl <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

#Unzip the file and get list of files

unzip(zipfile="./data/Dataset.zip",exdir="./data")
path_rf <- file.path("./data" , "summarySCC_PM25")
files<-list.files(path_rf, recursive=TRUE)


# Read data from files

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")


# Aggregate total emissions from PM2.5, convert from tons to kilotons
EmissionsPM2.5 <- aggregate(NEI[c("Emissions")]/1000, list(year = NEI$year), sum)

# Create the line plot
plot(EmissionsPM2.5$year, EmissionsPM2.5$Emissions, type="b", xlab = "Year", 
     ylab = expression("Emissions of PM 2.5 in Ktons)"), 
     main = expression("Total emissions from PM 2.5"), col = "red")
