setwd("~")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

globalActivePower <- subset_data$Global_active_power
datetime <- paste(subset_data$Date,  subset_data$Time, sep = ' ')
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
png("~/ExData_Plotting1/figure/plot2.png", width = 480, height = 480)

plot(datetime, as.numeric(globalActivePower), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()