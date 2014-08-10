source('file_tools.R')

data <- load_data()

# draw the plots

par(mfrow = c(2, 2),cex.lab=0.8) 

with(data, {
  # plot 1
  plot(x=data$datetime,y=data$Global_active_power,type="l",
       ylab = "Global Active Power",
       xlab = "")  

  # plot 2
  plot(x=data$datetime,y=data$Voltage,type="l",
       ylab = "Voltage",
       xlab = "datetime")

  # plot 3
  plot(x=data$datetime,y=data$Sub_metering_1,type="l",
       ylab="Energy Sub Metering",
       xlab="")
  lines(x=data$datetime,y=data$Sub_metering_2,col="red")
  lines(x=data$datetime,y=data$Sub_metering_3,col="blue")
  legend("topright", lty=1, col = c("black", "red", "blue"), 
         c("Sub_metering_1",
                    "Sub_metering_2",
                    "Sub_metering_3"),
         cex = 0.7,
         bty="n",
         text.width = strwidth("Sub_metering_2   "),
         )
  
  # plot 4
  plot(x=data$datetime,y=data$Global_reactive_power,type="l",
       ylab = "Global_reactive_power",
       xlab = "datetime")
  
  })

write_to_file("plot4.png")