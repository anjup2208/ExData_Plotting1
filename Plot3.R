#Set the file URL 
fileurl <- "C:/DataScience/Assignment/EDA/household_power_consumption.txt"

#Load the Data (all)
all_housedata <- read.csv(fileurl, header=T, sep=';', na.strings="?", nrows= 2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Subset only data for this assignment 
relevant_data <- subset(all_housedata, Date %in% c("1/2/2007","2/2/2007"))

#Update the Date Format 
relevant_data$Date <- as.Date(relevant_data$Date, format="%d/%m/%Y")

#Concatinate the Date & time into column Datetime
datetime <- paste(as.Date(relevant_data$Date), relevant_data$Time)
relevant_data$Datetime <- as.POSIXct(datetime)

##### Plot 3  Submetering against Datetime
### step1 - plot Submetering 1  
### step2 - add line for submetering 2 color= red
####step 3 - add line for submetering 3 color =blue
with(relevant_data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

# Add the Legend  top right corner 
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),xjust=1,yjust=1)

#copy to png
dev.copy(png, filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")
#Close the devices
dev.off()
