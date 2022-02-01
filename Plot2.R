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
