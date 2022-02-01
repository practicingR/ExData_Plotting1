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

## Set Gobal_active_power as numeric class
     powerconsumptionsubset$Global_active_power <- as.numeric(powerconsumptionsubset$Global_active_power)

## Create a png file title "plot1.png" with width 480 of pixels and height of 480 pixels
     png("plot1.png", width = 480, height = 480)
     
     ### Plot the histogram with set parameters
          hist(powerconsumptionsubset$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red")
     
     ### Close graphic device
          dev.off()
