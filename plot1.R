library(downloader) 
library(dplyr) 
library(lubridate)

################################################################################################### 
#################If you already have the data in your working directory         ################### 
#################skip to next section break.                                    ################### 
################################################################################################### 

# Download and extract the .zip data. 
# Set working directory to location you would like download and unzip the project data files. 

# This assumes you do not have the dataset unzipped in your working directory. 
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
download(fileUrl, dest = "./WK1_project_data.zip", mode = "wb") 

# Extract the data from the zip file.   
unzip("WK1_project_data.zip", exdir = "./WK1_project_data") 

# Set working directory to unzipped files location. 
setwd("./WK1_project_data") 

###################################################################################################
###################################################################################################

# Read in table from working directory
power_init <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, dec = ".", na.string = "?")

# subest the data to only data betwee 2007-02-01 and 2007-02-02
power <- subset(power_init, Date == "1/2/2007"| Date == "2/2/2007")

# construct the first graph (histogram)
power$Global_active_power <- as.numeric(power$Global_active_power)
hist(power$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency", col="red")

# copy 1st graph to folder
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()