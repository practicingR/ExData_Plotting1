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

## Set variables as a numeric class
     powerconsumptionsubset$Global_active_power <- as.numeric(powerconsumptionsubset$Global_active_power)
     powerconsumptionsubset$Sub_metering_1 <- as.numeric(powerconsumptionsubset$Sub_metering_1)
     powerconsumptionsubset$Sub_metering_2 <- as.numeric(powerconsumptionsubset$Sub_metering_2)
     powerconsumptionsubset$Sub_metering_3 <- as.numeric(powerconsumptionsubset$Sub_metering_3)
     powerconsumptionsubset$Global_reactive_power <- as.numeric(powerconsumptionsubset$Global_reactive_power)
