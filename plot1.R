setwd("~")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

global_active_power <- as.numeric(subset_data$Global_active_power)
png("~/ExData_Plotting1/figure/plot1.png", width = 480, height = 480)

hist(global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()