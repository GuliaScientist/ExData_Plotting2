library("plyr")

# Load data
NEI <- readRDS("~/Coursera/Assignments/Exploritory Data Analysis/Data/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/Coursera/Assignments/Exploritory Data Analysis/Data/exdata_data_NEI_data/Source_Classification_Code.rds")

data<-transform(NEI,year=factor(year))

#Plot Data
plotdata<-ddply(data,.(year),summarize,sum=sum(Emissions))
png("plot1.png")
plot(plotdata$year,plotdata$sum,type="n",xlab="year",ylab="total PM2.5 Emission",boxwex=0.05)
lines(plotdata$year,plotdata$sum)
dev.off()
