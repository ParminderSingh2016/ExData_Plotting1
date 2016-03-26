if(!file.exists('data.zip')){
  url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
  download.file(url,destfile = "data.zip")
}
unzip("data.zip")
data<-read.table("household_power_consumption.txt",header = TRUE, sep= ";")
data$DateTime<-paste(data$Date,data$Time)
data$DateTime<-strptime(data$DateTime,"%d/%m/%Y %H:%M:%S")
start<-which(data$DateTime==strptime("2007-02-01","%Y-%m-%d"))
end<-which(data$DateTime==strptime("2007-02-02 23:59:00","%Y-%m-%d %H:%M:%S"))
data2<-data[start:end,]
hist(as.numeric(as.character(data2$Global_active_power)),main="Global Active Power",xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png,'plot1.png')
dev.off()