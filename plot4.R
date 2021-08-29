setwd("~")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

datetime <- paste(subset_data$Date,  subset_data$Time, sep = ' ')
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

global_active_power <- as.numeric(subset_data$Global_active_power)
global_reactive_power <- as.numeric(subset_data$Global_reactive_power)

voltage <- as.numeric(subset_data$Voltage)

sub_metering_1 <- as.numeric(subset_data$Sub_metering_1)
sub_metering_2 <- as.numeric(subset_data$Sub_metering_2)
sub_metering_3 <- as.numeric(subset_data$Sub_metering_3)

png("~/ExData_Plotting1/figure/plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

plot(datetime, as.numeric(global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_metering_2, type="l", col="red")
lines(datetime, sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()