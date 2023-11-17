## Import datasets
install.packages("tidyverse")
install.packages("dplyr")
library(tidyverse)
library(dplyr)

# imports datasets into RStudio
trips_202210_data <- read.csv("data/raw/202210-baywheels-tripdata.csv")
trips_202211_data <- read.csv("data/raw/202211-baywheeels-tripdata.csv")
trips_202212_data <- read.csv("data/raw/202212-baywheels-tripdata.csv")
trips_202301_data <- read.csv("data/raw/202301-baywheels-tripdata.csv")
trips_202302_data <- read.csv("data/raw/202302-baywheels-tripdata.csv")
trips_202303_data <- read.csv("data/raw/202303-baywheels-tripdata.csv")
trips_202304_data <- read.csv("data/raw/202304-baywheels-tripdata.csv")
trips_202305_data <- read.csv("data/raw/202305-baywheels-tripdata.csv")
trips_202306_data <- read.csv("data/raw/202306-baywheels-tripdata.csv")
trips_202307_data <- read.csv("data/raw/202307-baywheels-tripdata.csv")
trips_202308_data <- read.csv("data/raw/202308-baywheels-tripdata.csv")
trips_202309_data <- read.csv("data/raw/202309-baywheels-tripdata.csv")

# merges datasets into one raw file
trips_202210_202309_raw <- rbind(trips_202210_data, trips_202211_data, trips_202212_data, trips_202301_data, trips_202302_data, trips_202303_data, trips_202304_data, trips_202305_data, trips_202306_data, trips_202307_data, trips_202308_data, trips_202309_data)

# makes a copy of the raw file that we can process and clean
trips_202210_202309_precleaned <- trips_202210_202309_raw

