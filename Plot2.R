library("plyr")

# Load data
NEI <- readRDS("~/Coursera/Assignments/Exploritory Data Analysis/Data/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/Coursera/Assignments/Exploritory Data Analysis/Data/exdata_data_NEI_data/Source_Classification_Code.rds")


data<-transform(NEI,year=factor(year))
data2<-data[data$fips=="24510",]

#Plot Data
plotdata2<-ddply(data2,.(year),summarize,sum=sum(Emissions))
png("plot2.png")
plot(plotdata2$year,plotdata2$sum,type="n",xlab="year",ylab="total PM2.5 Emission",
     main="PM2.5 emission in Baltimore City",boxwex=0.05)
lines(plotdata2$year,plotdata2$sum)
dev.off()
