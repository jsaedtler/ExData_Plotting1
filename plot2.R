source('file_tools.R')

data <- load_data()

# draw plot
par(mfrow = c(1, 1)) 
plot(x=data$datetime,y=data$Global_active_power,type="l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

write_to_file("plot2.png")