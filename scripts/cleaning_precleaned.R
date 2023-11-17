# Data cleaning


# First we import datasets ranging from 2022/10-2023/09
## Import datasets
install.packages("tidyverse")
install.packages("dplyr")
library(tidyverse)
library(dplyr)

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


# Merge the datasets into one raw central dataset
trips_202210_202309_raw <- rbind(trips_202210_data, trips_202211_data, trips_202212_data, trips_202301_data, trips_202302_data, trips_202303_data, trips_202304_data, trips_202305_data, trips_202306_data, trips_202307_data, trips_202308_data, trips_202309_data)


# makes a copy of the raw file so that we can clean the data
trips_202210_202309_precleaned <- trips_202210_202309_raw


# Removes duplicates
library(dplyr)

trips_202210_202309_precleaned <- trips_202210_202309_precleaned %>%
  distinct(ride_id, .keep_all = TRUE)


# Filter the dataset to keep records with non-empty values in these columns
trips_202210_202309_precleaned <- trips_202210_202309_precleaned %>%
  filter(start_station_id != "",
         end_station_id != "",
         start_station_name != "",
         end_station_name != "")

# Remove null values
# Count the number of null started_at values
null_started_at_count <- sum(is.na(trips_202210_202309_precleaned$started_at))
# Print the count
cat("Number of null started_at values:", null_started_at_count, "\n")

# Count the number of null ended_at values
null_ended_at_count <- sum(is.na(trips_202210_202309_precleaned$ended_at))
# Print the count
cat("Number of null ended_at values:", null_ended_at_count, "\n")

# Count the number of null start_station_name values
null_started_name_count <- sum(is.na(trips_202210_202309_precleaned$start_station_name))
# Print the count
cat("Number of null start_station_name values:", null_started_name_count, "\n")

# Count the number of null end_station_name values
null_ended_name_count <- sum(is.na(trips_202210_202309_precleaned$end_station_name))
# Print the count
cat("Number of null end_station_name values:", null_ended_name_count, "\n")

# Count the number of null start_station_id values
null_started_id_count <- sum(is.na(trips_202210_202309_precleaned$start_station_id))
# Print the count
cat("Number of null start_station_id values:", null_started_id_count, "\n")

# Count the number of null end_station_id values
null_end_id_count <- sum(is.na(trips_202210_202309_precleaned$end_station_id))
# Print the count
cat("Number of null end_station_id values:", null_end_id_count, "\n")

# Count the number of null end_station_id values
null_end_id_count <- sum(is.na(trips_202210_202309_precleaned$end_station_id))
# Print the count
cat("Number of null end_station_id values:", null_end_id_count, "\n")

# Count the number of null start_lat values
null_start_lat_count <- sum(is.na(trips_202210_202309_precleaned$start_lat))
# Print the count
cat("Number of null start_lat values:", null_start_lat_count, "\n")

# Count the number of null start_lng values
null_start_lng_count <- sum(is.na(trips_202210_202309_precleaned$start_lng))
# Print the count
cat("Number of null start_lng values:", null_start_lng_count, "\n")

# Count the number of null end_lat values
null_end_lat_count <- sum(is.na(trips_202210_202309_precleaned$end_lat))
# Print the count
cat("Number of null end_lat values:", null_end_lat_count, "\n")

# Count the number of null end_lng values
null_end_lng_count <- sum(is.na(trips_202210_202309_precleaned$end_lng))
# Print the count
cat("Number of null end_lng values:", null_end_lng_count, "\n")

# Count the number of null member_casual values
null_member_casual_count <- sum(is.na(trips_202210_202309_precleaned$member_casual))
# Print the count
cat("Number of null member_casual values:", null_member_casual_count, "\n")

# Count the number of null rideable_type values
null_rideable_type_count <- sum(is.na(trips_202210_202309_precleaned$rideable_type))
# Print the count
cat("Number of null rideable_type values:", null_rideable_type_count, "\n")


# Filter the dataset to keep records with non-empty values in these columns
trips_202210_202309_precleaned <- trips_202210_202309_precleaned %>%
  filter(start_station_id != "",
         end_station_id != "",
         start_station_name != "",
         end_station_name != "")


# Create column called 'duration'
# Convert 'started_at' and 'ended_at' columns to datetime objects
trips_202210_202309_precleaned$started_at <- as.POSIXct(trips_202210_202309_precleaned$started_at, format = "%Y-%m-%d %H:%M:%S")
trips_202210_202309_precleaned$ended_at <- as.POSIXct(trips_202210_202309_precleaned$ended_at, format = "%Y-%m-%d %H:%M:%S")

# Calculate the duration in seconds
trips_202210_202309_precleaned$duration <- as.numeric(difftime(trips_202210_202309_precleaned$ended_at, trips_202210_202309_precleaned$started_at, units = "secs"))

# Convert the 'duration' column from seconds to minutes
trips_202210_202309_precleaned$duration <- trips_202210_202309_precleaned$duration / 60


# Remove records where 'duration' is less than or equal to zero
trips_202210_202309_precleaned <- trips_202210_202309_precleaned %>%
  filter(duration > 0)


# Remove records containing "Test"
filtered_data <- trips_202210_202309_precleaned %>%
  filter_all(any_vars(!str_detect(., "Test")))


# Convert 'started_at' and 'ended_at' to datetime, replacing invalid entries with NA
trips_202210_202309_precleaned <- trips_202210_202309_precleaned %>%
  mutate(
    started_at = as.POSIXct(started_at, format = "%Y-%m-%d %H:%M:%S", tz = "UTC"),
    ended_at = as.POSIXct(ended_at, format = "%Y-%m-%d %H:%M:%S", tz = "UTC")
  )

library(lubridate)

# Adjust 'started_at' and 'ended_at' columns to 'America/Los_Angeles' timezone
trips_202210_202309_precleaned$started_at <- with_tz(trips_202210_202309_precleaned$started_at, tzone = "America/Los_Angeles")
trips_202210_202309_precleaned$ended_at <- with_tz(trips_202210_202309_precleaned$ended_at, tzone = "America/Los_Angeles")
