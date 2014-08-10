load_data <- function(){
  download_file <- T
  
  if(download_file){
    url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
    download.file(url,destfile = "./power_consumption.zip", method="curl",mode='wb')
    unzip('power_consumption.zip')
  }
  
  data = read.csv("household_power_consumption.txt",sep=";",
                  skip=60000, nrows=10000, header = F,
                  stringsAsFactors=F)
  header = read.csv("household_power_consumption.txt",sep=";", nrows=1)
  data[,1] = as.Date(data[,1], "%d/%m/%Y")
  data[,3] = as.numeric(as.character(data[,3]))
  names(data)=names(header)
  data = subset(data,Date == "2007-02-01" | Date == "2007-02-02")
  
  datetime = apply(data[,1:2], 1, FUN = function(x) {
    paste(x,collapse=" ")
  })
  data <- cbind(datetime,data)
  data$datetime = strptime(data$datetime,"%Y-%m-%d %H:%M:%S" )
  data
}

write_to_file <- function(filename) {
  dev.copy(png,filename,width = 480,height=480)
  dev.off()
}