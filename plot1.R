source('file_tools.R')

data <- load_data()

# draw the histogram
par(mfrow = c(1, 1)) 
hist(data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")


write_to_file("plot1.png")