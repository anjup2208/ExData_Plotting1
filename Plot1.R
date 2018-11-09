#Set the file URL 
fileurl <- "C:/DataScience/Assignment/EDA/household_power_consumption.txt"

#Load the Data (all)
all_housedata <- read.csv(fileurl, header=T, sep=';', na.strings="?", nrows= 2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Subset only data for this assignment 
relevant_data <- subset(all_housedata, Date %in% c("1/2/2007","2/2/2007"))

#Update the Date Format 
relevant_data$Date <- as.Date(relevant_data$Date, format="%d/%m/%Y")

######Construct Plot 1 - Histogram - Global Active Power 
hist(relevant_data$Global_active_power,main="Global Active Power",col="red", xlab="Global Active Power (kilowatts)")

#copy to png
dev.copy(png, filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")
#Close the devices
dev.off()

