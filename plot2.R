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

## Set Global_active_power as a numeric class
     powerconsumptionsubset$Global_active_power <- as.numeric(powerconsumptionsubset$Global_active_power)

## Format Time and Date using strptime() and as.Date(), respectively
     powerconsumptionsubset$Time <- strptime(powerconsumptionsubset$Time, format = "%H:%M:%S")
     powerconsumptionsubset$Date <- as.Date(powerconsumptionsubset$Date, format = "%d/%m/%Y")
     
     ### Change dates under the Time column to reflect the correct dates
          powerconsumptionsubset[1:1440, "Time"] <- format(powerconsumptionsubset[1:1440, "Time"],"2007-02-01 %H:%M:%S")
          powerconsumptionsubset[1441:2880, "Time"] <- format(powerconsumptionsubset[1441:2880, "Time"],"2007-02-02 %H:%M:%S")

# Create a png file titled "plot2.png" with width 480 of pixels and height of 480 pixels
     png("plot2.png", width = 480, height = 480)

     ### Plot the graph with set parameters
          plot(powerconsumptionsubset$Time, powerconsumptionsubset$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="l")

     ### Close graphic device
          dev.off()



