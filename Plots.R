#Exploratory Data Analysis
#Reading the household power consumption data and assigned it to variable files
#Using data from 2007-02-01 and 2007-02-02
files <- file("/Users/USER/Desktop/specdata_2/household_power_consumption_data/household_power_consumption.txt")  
pwr_consumption<- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')  

#Making 4 plots 
#Plot 1 
#creating plot 1
png(filename = "./plot1.png", width = 480, height = 480, units="px")  
# Figure of the plot 
with(pwr_consumption, hist(Global_active_power, xlab = "Global Active Power (kilowatt)", main = "Global Active Power", col = "red"))  
#close device  
dev.off()  


#Plot 2  
#converting the date and time to specific format  
pwr_consumption$Date <- as.Date(pwr_consumption$Date, format = "%d/%m/%Y")  
pwr_consumption$DateTime <- as.POSIXct(paste(pwr_consumption$Date,pwr_consumption$Time))  

#creating plot 2
png(filename = "./plot2.png", width = 480, height = 480, units="px")  
#figure of the plot 2 
Sys.setlocale(category = "LC_ALL", locale = "English")  
plot(pwr_consumption$DateTime,pwr_consumption$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")  
#close device  
dev.off()  


#Plot 3
#creating plot 3
png(filename = "./plot3.png", width = 480, height = 480, units="px")  
#figure of the plot 3
Sys.setlocale(category = "LC_ALL", locale = "English")  
plot(pwr_consumption$DateTime, pwr_consumption$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")  
lines(pwr_consumption$DateTime, pwr_consumption$Sub_metering_2, col = "red")  
lines(pwr_consumption$DateTime, pwr_consumption$Sub_metering_3, col = "blue")  
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)  
#close device  
dev.off()  


#Plot 4
#creating plot 4
png(filename = "./plot4.png", width = 480, height = 480, units="px")  
#figure of the plot 4 
Sys.setlocale(category = "LC_ALL", locale = "English")  
par(mfrow = c(2, 2))  
plot(pwr_consumption$DateTime,pwr_consumption$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")  
plot(pwr_consumption$DateTime,pwr_consumption$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")  
plot(pwr_consumption$DateTime,pwr_consumption$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")  
lines(pwr_consumption$DateTime,pwr_consumption$Sub_metering_2, col = "red")  
lines(pwr_consumption$DateTime,pwr_consumption$Sub_metering_3, col = "blue")  
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)  
plot(pwr_consumption$DateTime,pwr_consumption$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")  
#close device  
dev.off()  