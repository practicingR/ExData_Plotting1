## Unzip and download the data

     householdpowerconsumption <- "exdata_data_household_power_consumption.zip"
  
     ### Data is put into a folder called "Course 4" in the desired destination location

      if (!file.exists(householdpowerconsumption)) {
       fileURL <- "http://archive.ics.uci.edu/ml/index.php.zip"
         download.file(fileURL, destfile = "~/R/R Course/Course4", method="curl")
       }

       if(!file.exists("Course 4")){
          unzip(householdpowerconsumption)
        }

## Read the file
     householdpowerconsumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

     ### Subset data for dates 1/2/2007 and 2/2/2007 (two-day period)
          powerconsumptionsubset <- subset(householdpowerconsumption, householdpowerconsumption$Date =="1/2/2007" | householdpowerconsumption$Date=="2/2/2007")

## Format Time and Date using strptime() and as.Date(), respectively
     powerconsumptionsubset$Time <- strptime(powerconsumptionsubset$Time, format = "%H:%M:%S")
     powerconsumptionsubset$Date <- as.Date(powerconsumptionsubset$Date, format = "%d/%m/%Y")
     
     ### Change dates under the Time column to reflect the correct dates
          powerconsumptionsubset[1:1440, "Time"] <- format(powerconsumptionsubset[1:1440, "Time"],"2007-02-01 %H:%M:%S")
          powerconsumptionsubset[1441:2880, "Time"] <- format(powerconsumptionsubset[1441:2880, "Time"],"2007-02-02 %H:%M:%S")

## Set sum_metering columns as a numeric class
     powerconsumptionsubset$Sub_metering_1 <- as.numeric(powerconsumptionsubset$Sub_metering_1)
     powerconsumptionsubset$Sub_metering_2 <- as.numeric(powerconsumptionsubset$Sub_metering_2)
     powerconsumptionsubset$Sub_metering_3 <- as.numeric(powerconsumptionsubset$Sub_metering_3)

# Create a png file titled "plot3.png" with width 480 of pixels and height of 480 pixels
     png("plot3.png", width = 480, height = 480)

     ### Plot the graph with set parameters
          plot(powerconsumptionsubset$Time, powerconsumptionsubset$Sub_metering_1, type="l", col = "black", xlab = "", ylab = "Energy sub metering")
          lines(powerconsumptionsubset$Time, powerconsumptionsubset$Sub_metering_2, type="l", col = "red")
          lines(powerconsumptionsubset$Time, powerconsumptionsubset$Sub_metering_3, type="l", col = "blue")
          legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

     ### Close graphic device
          dev.off()
