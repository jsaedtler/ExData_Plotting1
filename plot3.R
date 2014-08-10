source('file_tools.R')

data <- load_data()

# draw plot
par(mfrow = c(1, 1)) 
plot(x=data$datetime,y=data$Sub_metering_1,type="l",ylab="Energy Sub Metering")
lines(x=data$datetime,y=data$Sub_metering_2,col="red")
lines(x=data$datetime,y=data$Sub_metering_3,col="blue")

legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"))

write_to_file("plot3.png")